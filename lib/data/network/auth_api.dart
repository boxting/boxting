import 'package:boxting/data/network/response/login_response.dart';
import 'package:dio/dio.dart';

class AuthenticationApi {
  Dio dio;
  AuthenticationApi(Dio dio) {
    this.dio = dio;
    dio.options.baseUrl = 'https://blockchain-voting.herokuapp.com/';
    dio.options.connectTimeout = 20000; //5s
    dio.options.receiveTimeout = 20000;
  }

  Future<LoginResponse> login(String username, String password) async {
    final response = await dio.post(
      'user/voter/login',
      data: {
        'username': username,
        'password': password,
      },
    );
    return LoginResponse.fromJson(response.data);
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
    final response = await dio.post(
      'user/voter/add',
      data: {
        'username': username,
        'password': password,
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
  }
}
