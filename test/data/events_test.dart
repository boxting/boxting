import 'dart:math';

import 'package:boxting/data/network/boxting_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';

import '../utils/mocks.dart';

BoxtingClient _client;
MockWebServer _mockWebServer;
final jsonHeader = {'Content-Type': 'application/json'};
void main() {
  setUp(() async {
    _mockWebServer = MockWebServer();
    await _mockWebServer.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    _client = BoxtingClient(dio, baseUrl: _mockWebServer.url);
  });

  tearDown(() async => _mockWebServer.shutdown());

  test('fetch events for user success', () async {
    final body = '''
    {
    "success": true,
    "data": [
          {
              "id": 1,
              "name": "New updated event",
              "information": "Information about this new event",
              "startDate": "2021-10-26T20:00:00.000Z",
              "endDate": "2021-10-27T00:00:00.000Z",
              "code": "bq1bvsnl7l",
              "createdAt": "2021-01-20T06:29:40.000Z",
              "updatedAt": "2021-01-24T18:28:10.000Z"
          },
          {
              "id": 2,
              "name": "New updated event",
              "information": "Information about this new event",
              "startDate": "2021-10-26T20:00:00.000Z",
              "endDate": "2021-10-27T00:00:00.000Z",
              "code": "bq1bvsnl7l",
              "createdAt": "2021-01-20T06:29:40.000Z",
              "updatedAt": "2021-01-24T18:28:10.000Z"
          }
      ]
    }
    ''';
    _mockWebServer.enqueue(body: body, headers: jsonHeader);
    final result = await _client.fetchEvents();
    expect(result, isNotNull);
    expect(result.success, true);
    result.data.forEach((event) {
      expect(event.id, isNotNull);
      expect(event.code, isNotEmpty);
      expect(event.information, isNotEmpty);
    });
  });

  test('subscribe the user to a new event - success', () async {
    final body = '''
    {
        "success": true,
        "data": {
            "isOwner": false,
            "isCollaborator": false,
            "userId": 3,
            "eventId": 1,
            "accessCode": "Code1",
            "updatedAt": "2021-01-24T18:31:04.465Z",
            "createdAt": "2021-01-24T18:31:04.465Z"
        }
    }
    ''';
    _mockWebServer.enqueue(body: body, headers: jsonHeader);
    final result = await _client.subscribeNewEvent(MockSubscribeEventRequest());
    expect(result, isNotNull);
    expect(result.success, true);
    expect(result.data.eventId, 1);
    expect(result.data.userId, 3);
  });

  test('unsubscribe user from votation event', () async {
    final body = '''
    {
        "success": true,
        "data": "User unsubscribed."
    }
    ''';
    _mockWebServer.enqueue(body: body, headers: jsonHeader);
    final mockEventId = 'mock_event_id';
    final result = await _client.unsubscribeVoterFromEvent(mockEventId);
    expect(result, isNotNull);
    expect(result.success, true);
  });

  test('fetch event detail - success', () async {
    final body = '''
    {
        "success": true,
        "data": {
            "id": 1,
            "name": "New voting event",
            "information": "Information about this new event",
            "startDate": "2021-10-23T23:00:00.000Z",
            "endDate": "2021-10-24T02:00:00.000Z",
            "code": "bq1bvsnl7l",
            "createdAt": "2021-01-20T06:29:40.000Z",
            "updatedAt": "2021-01-20T06:29:40.000Z"
        }
    }
    ''';
    _mockWebServer.enqueue(body: body, headers: jsonHeader);
    final mockEventId = 'mock_event_id';
    final result = await _client.fetchEventById(mockEventId);
    expect(result, isNotNull);
    expect(result.success, true);
    expect(result.data.id, 1);
    expect(result.data.information, isNotEmpty);
  });

  test('fetch event detail - unsuccess', () async {
    final body = '''
    {
        "success": false,
        "error": {
            "name": "NotPermittedError",
            "message": "You don't have access to this event.",
            "statusCode": 403,
            "errorCode": 4011
        }
    }
    ''';
    _mockWebServer.enqueue(body: body, headers: jsonHeader);
    final mockEventId = 'mock_event_id';
    final result = await _client.fetchEventById(mockEventId);
    expect(result, isNotNull);
    expect(result.success, false);
    expect(result.error, isNotNull);
    expect(result.error.errorCode, 4011);
  });

  test('subscribe the user to a new event - unsuccess', () async {
    final body = '''
    {
        "success": false,
        "error": {
            "name": "BadRequestError",
            "message": "The access code is invalid for this event.",
            "statusCode": 400,
            "errorCode": 4008
        }
    }
    ''';
    _mockWebServer.enqueue(body: body, headers: jsonHeader);
    final result = await _client.subscribeNewEvent(MockSubscribeEventRequest());
    expect(result, isNotNull);
    expect(result.success, false);
    expect(result.error, isNotNull);
    expect(result.error.errorCode, 4008);
    expect(result.error.name, isNotEmpty);
  });
}
