import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginRepositoryImpl implements LoginRepository {
  final BoxtingClient boxtingClient;

  LoginRepositoryImpl({@required this.boxtingClient});

  Future<void> _saveFirstTimeLogin() async {
    var box = await Hive.openBox('BoxtingBox');
    await box.put('isFirstTimeLogin', false);
  }

  @override
  Future<bool> isFirstTimeLogin() async {
    var box = await Hive.openBox('BoxtingBox');
    var isFirstTimeLogin = box.get('isFirstTimeLogin', defaultValue: true);
    return isFirstTimeLogin;
  }

  @override
  Future<bool> login(String username, String password) async {
    try {
      final loginRequest = LoginRequest(username: username, password: password);
      final loginResponse = await boxtingClient.login(loginRequest);
      if (loginResponse.error != null) {
        throw Exception();
      }
      await _saveFirstTimeLogin();
      return loginResponse.success;
    } on DioError catch (e) {
      final statusCodeError = e.response.data['error']['errorCode'];
      throw BoxtingFailure(statusCode: statusCodeError ?? 999);
    } catch (e) {
      throw BoxtingFailure(statusCode: 999);
    }
  }
}
