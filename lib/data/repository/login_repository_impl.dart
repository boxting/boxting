import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/auth_api.dart';
import 'package:boxting/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthenticationApi loginApi;

  LoginRepositoryImpl({@required this.loginApi});

  @override
  Future<bool> login(String username, String password) async {
    try {
      final loginResponse = await loginApi.login(username, password);
      // TODO: Save user information
      return loginResponse.success;
    } on DioError catch (e) {
      throw BoxtingFailure(
        statusCode: e.response.statusCode,
        message: e.response.data['error']['message'] ??
            'Ocurrió un error desconocido',
      );
    }
  }
}
