import 'package:boxting/data/network/response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class LoginApi {
  var dio = Dio();

  LoginApi() {
    dio.options.baseUrl = "https://blockchain-voting.herokuapp.com/";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
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
}
