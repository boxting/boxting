import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
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
        throw BoxtingException(statusCode: dniResponse.error.statusCode);
      }
      return dniResponse.data;
    } on BoxtingException catch (e) {
      throw BoxtingException(statusCode: e?.statusCode ?? UNKNOWN_ERROR);
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
      final statusCodeError =
          e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: statusCodeError);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
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
      throw BoxtingException(statusCode: statusCodeError ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DefaultResponse> sendForgotPassword(String mail) async {
    try {
      final request = ForgotPasswordRequest(mail: mail);
      return await boxtingClient.sendForgotPassword(request);
    } on BoxtingException catch (e) {
      throw BoxtingException(statusCode: e?.statusCode ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DefaultResponse> setNewPassword(
    String mail,
    String token,
    String password,
  ) async {
    try {
      final request =
          NewPasswordRequest(mail: mail, token: token, newPassword: password);
      return await boxtingClient.setNewPassword(request);
    } on BoxtingException catch (e) {
      throw BoxtingException(statusCode: e?.statusCode ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DefaultResponse> validatePasswordToken(
    String mail,
    String token,
  ) async {
    try {
      final request = ValidateTokenRequest(mail: mail, token: token);
      return await boxtingClient.validatePasswordToken(request);
    } on BoxtingException catch (e) {
      throw BoxtingException(statusCode: e?.statusCode ?? UNKNOWN_ERROR);
    }
  }
}
