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

  test('success login test', () async {
    final successResponse = '''
    {
      "success": true,
      "data": {
        "id": 2,
        "username": "RodrigoAGM",
        "role": {
          "name": "VOTER"
        },
        "voter": {
          "id": 1,
          "firstName": "Rodrigo",
          "lastName": "Guadalupe",
          "dni": "70854323",
          "mail": "rodgm18@gmail.com",
          "phone": "957276050"
        },
        "token": "user-auth-token"
      }
  }
  ''';
    _mockWebServer.enqueue(
      body: successResponse,
      headers: jsonHeader,
    );
    final result = await _client.login(MockLoginRequest());
    expect(result.data, isNotNull);
    expect(result.error, isNull);
    expect(result.success, true);
    expect(result.data.token, isNotEmpty);
  });

  test('failed login test', () async {
    final failResponse = '''
    {
      "success": false,
      "error": {
          "name": "BadRequestError",
          "message": "The password inserted is incorrect",
          "statusCode": 400,
          "errorCode": 1002
      }
    }
    ''';
    _mockWebServer.enqueue(
      body: failResponse,
      headers: jsonHeader,
    );
    final result = await _client.login(MockLoginRequest());
    expect(result.error, isNotNull);
    expect(result.error.statusCode, 400);
    expect(result.success, false);
  });
}
