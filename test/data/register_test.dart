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

  test('success register test', () async {
    final successResponse = '''
    {
      "success": true,
      "data": {
        "isActive": true,
        "id": 2,
        "username": "RodrigoAGM",
        "voter": {
          "id": 1,
          "firstName": "Rodrigo",
          "lastName": "Guadalupe",
          "dni": "70854323",
          "mail": "rodgm18@gmail.com",
          "phone": "957276050",
          "userId": 2,
          "updatedAt": "2021-01-11T21:23:21.691Z",
          "createdAt": "2021-01-11T21:23:21.691Z"
        },
        "updatedAt": "2021-01-11T21:23:21.629Z",
        "createdAt": "2021-01-11T21:23:21.629Z"
      }
    }
  ''';
    _mockWebServer.enqueue(
      body: successResponse,
      headers: jsonHeader,
    );
    final result = await _client.register(MockRegisterRequest());
    expect(result, isNotNull);
    expect(result.success, true);
    assert(result.data.id > 0);
  });

  test('failed register test', () async {
    final successResponse = '''
    {
      "success": false,
      "error": {
          "name": "BadRequestError",
          "message": "Dni is already registered",
          "statusCode": 400,
          "errorCode": 2006
      }
    }
  ''';
    _mockWebServer.enqueue(
      body: successResponse,
      headers: jsonHeader,
    );
    final result = await _client.register(MockRegisterRequest());
    expect(result.success, false);
    expect(result.error, isNotNull);
    expect(result.error.statusCode, 400);
  });

  test('success retrieve dni information', () async {
    final fakeDni = '12345678';
    final successResponse = '''
    {
      "success": true,
      "data": {
        "dni": "70854423",
        "cui": 5,
        "apellido_paterno": "TORRES",
        "apellido_materno": "HERRERA",
        "nombres": "JEAN MARCOS"
      }
    }
    ''';
    _mockWebServer.enqueue(
      headers: jsonHeader,
      body: successResponse,
    );
    final result = await _client.getDniInformation(fakeDni);
    expect(result.success, true);
    expect(result.data, isNotNull);
  });
  test('failed retrieve dni information', () async {
    final fakeBadDni = '987654321';
    final failResponse = '''
    {
      "success": false,
      "error": {
          "name": "BadRequestError",
          "message": "The ID length is incorrect",
          "statusCode": 400,
          "errorCode": 2008
      }
    }
    ''';
    _mockWebServer.enqueue(
      body: failResponse,
      headers: jsonHeader,
    );
    final result = await _client.getDniInformation(fakeBadDni);
    expect(result.success, false);
    expect(result.error, isNotNull);
  });
}
