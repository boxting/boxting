import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/auth_api.dart';
import 'package:boxting/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthenticationApi loginApi;

  LoginRepositoryImpl({@required this.loginApi});

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
      final loginResponse = await loginApi.login(username, password);
      await _saveFirstTimeLogin();
      return loginResponse.success;
    } on DioError catch (e) {
      throw BoxtingFailure(
        statusCode: e.response.data['error']['errorCode'] ?? 999,
      );
    } catch (e) {
      throw BoxtingFailure(
        statusCode: 999,
      );
    }
  }
}
