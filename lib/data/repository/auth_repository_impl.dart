import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BoxtingClient boxtingClient;

  AuthRepositoryImpl(this.boxtingClient);
  @override
  Future<DniResponseData> fetchInformationFromReniec(String dni) async {
    try {
      // TODO: Remove mock response
      final dniResponse = await boxtingClient.getDniInformation(dni);
      // await Future.delayed(Duration(seconds: 3));
      // final dniResponse = DniResponse(
      //   success: true,
      //   error: null,
      //   data: DniResponseData(
      //     fatherLastname: 'fatherLastname',
      //     motherLastname: 'motherLastname',
      //     cui: 1,
      //     dni: '71930207',
      //     names: 'ENZO RODRIGO',
      //   ),
      // );
      if (dniResponse.error != null) {
        throw BoxtingFailure(statusCode: dniResponse.error.statusCode);
      }
      return dniResponse.data;
    } on BoxtingFailure catch (e) {
      throw BoxtingFailure(statusCode: e.statusCode);
    }
  }

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
      final statusCodeError = e.response.data['error']['errorCode'] ?? 999;
      throw BoxtingFailure(statusCode: statusCodeError);
    } catch (e) {
      throw BoxtingFailure(statusCode: 999);
    }
  }

  @override
  Future<bool> registerUser(String name, String lastname, String dni,
      String phone, String email, String username, String password) async {
    try {
      final registerRequest = RegisterRequest(
        username: username,
        password: password,
        mail: email,
        voter: VoterRequest(
          dni: dni,
          phone: phone,
          firstName: name,
          lastName: lastname,
        ),
      );
      final registerResponse = await boxtingClient.register(registerRequest);
      // TODO: Save user information
      return registerResponse.success;
    } on DioError catch (e) {
      final statusCodeError = e.response.data['error']['errorCode'];
      throw BoxtingFailure(statusCode: statusCodeError ?? 999);
    }
  }

  @override
  Future<void> sendForgotPassword(String mail) async {}
}
