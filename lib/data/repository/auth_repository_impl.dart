import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'utils.dart';

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
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<bool> isFirstTimeLogin() async {
    final box = await Hive.openBox(Constants.HIVE_BOX_NAME);
    return box.get(Constants.FIRST_LOGIN, defaultValue: true);
  }

  @override
  Future<bool> login(LoginRequest loginRequest) async {
    try {
      final loginResponse = await boxtingClient.login(loginRequest);
      await _saveFirstTimeLogin();
      await _saveAuthToken(loginResponse.data.token);
      // final userInfo = await getUserInformation();
      // await _saveUserInformation(userInfo.data.toUser());
      return loginResponse.success;
    } on DioError catch (e) {
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<bool> registerUser(RegisterRequest registerRequest) async {
    try {
      final registerResponse = await boxtingClient.register(registerRequest);
      return registerResponse.success;
    } on DioError catch (e) {
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
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
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
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
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
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
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  @override
  Future<UserResponse> getUserInformation() async {
    try {
      return await boxtingClient.getUserInformation();
    } on DioError catch (e) {
      final code =
          cast<int>(e.response.data[Constants.ERROR][Constants.ERROR_CODE])
              .orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: UNKNOWN_ERROR);
    }
  }

  Future<void> _saveFirstTimeLogin() async {
    final box = await Hive.openBox(Constants.HIVE_BOX_NAME);
    await box.put(Constants.FIRST_LOGIN, false);
  }

  Future<void> _saveAuthToken(String token) async {
    final secureStorage = getIt.get<FlutterSecureStorage>();
    await secureStorage.write(key: Constants.AUTH_TOKEN, value: token);
  }

  // Future<void> _saveUserInformation(User user) async {
  //   final box = await Hive.openBox(Constants.HIVE_USER_BOX);
  //   await box.put(Constants.HIVE_USER, user);
  // }
}
