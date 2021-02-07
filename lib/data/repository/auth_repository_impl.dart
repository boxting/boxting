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
      final dniResponse = await boxtingClient.getDniInformation(dni);
      if (dniResponse.error != null) {
        throw BoxtingException(statusCode: dniResponse.error.statusCode);
      }
      return dniResponse.data;
    } on DioError catch (e) {
      final errorCode = e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: errorCode);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
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
  Future<bool> login(LoginRequest loginRequest) async {
    try {
      final loginResponse = await boxtingClient.login(loginRequest);
      if (loginResponse.error != null) {
        throw Exception();
      }
      await _saveFirstTimeLogin();
      return loginResponse.success;
    } on DioError catch (e) {
      final errorCode = e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: errorCode);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<bool> registerUser(RegisterRequest registerRequest) async {
    try {
      final registerResponse = await boxtingClient.register(registerRequest);
      // TODO: Save user information
      return registerResponse.success;
    } on DioError catch (e) {
      final errorCode = e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: errorCode);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<DefaultResponse> sendForgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    try {
      return await boxtingClient.sendForgotPassword(forgotPasswordRequest);
    } on DioError catch (e) {
      final errorCode = e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: errorCode);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<DefaultResponse> setNewPassword(
    NewPasswordRequest newPasswordRequest,
  ) async {
    try {
      return await boxtingClient.setNewPassword(newPasswordRequest);
    } on DioError catch (e) {
      final errorCode = e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: errorCode);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<DefaultResponse> validatePasswordToken(
    ValidateTokenRequest validateTokenRequest,
  ) async {
    try {
      return await boxtingClient.validatePasswordToken(validateTokenRequest);
    } on DioError catch (e) {
      final errorCode = e.response.data['error']['errorCode'] ?? UNKNOWN_ERROR;
      throw BoxtingException(statusCode: errorCode);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }
}
