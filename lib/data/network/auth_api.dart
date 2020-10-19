import 'package:boxting/data/network/response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class AuthenticationApi {
  var dio = Dio();

  AuthenticationApi() {
    dio.options.baseUrl = "https://blockchain-voting.herokuapp.com/";
    dio.options.connectTimeout = 8000; //5s
    dio.options.receiveTimeout = 8000;
  }

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await dio.post(
        "user/voter/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      return LoginResponse.fromJson(response.data);
    } catch (e) {
      throw PlatformException(code: e);
    }
  }

  Future<LoginResponse> register(
    String name,
    String lastname,
    String username,
    String password,
    String dni,
    String mail,
    String phone,
  ) async {
    try {
      final response = await dio.post(
        "user/voter/add",
        data: {
          "username": username,
          "password": password,
          'voter': {
            'firstName': name,
            'lastName': lastname,
            'dni': dni,
            'mail': mail,
            'phone': phone,
          }
        },
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      throw PlatformException(code: e);
    }
  }
}
