import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/network/request/refresh_token_request/refresh_token_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/data/network/response/login_response/login_response.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/data/repository/utils.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/entities/either.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final boxtingClient = ref.read(boxtingClientProvider);
  final secureStorage = ref.read(secureStorageProvider);
  return AuthRepositoryImpl(
    boxtingClient: boxtingClient,
    secureStorage: secureStorage,
  );
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required BoxtingClient boxtingClient,
    required FlutterSecureStorage secureStorage,
  })  : boxtingClient = boxtingClient,
        _secureStorage = secureStorage;

  final BoxtingClient boxtingClient;
  final FlutterSecureStorage _secureStorage;

  @override
  Future<DniResponseData> fetchInformationFromReniec(String dni) async {
    try {
      final dniResponse = await boxtingClient.getDniInformation(dni);
      throw BoxtingException(statusCode: dniResponse.error!.statusCode);
      // return dniResponse.data;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<bool> isFirstTimeLogin() async {
    final box = await Hive.openBox<bool>(Constants.hiveBoxName);
    return Future.value(box.get(Constants.firstLogin, defaultValue: true));
  }

  @override
  Future<Either<Exception, LoginResponseData>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      final loginResponse = await boxtingClient.login(loginRequest);
      if (loginResponse.data != null) {
        await _saveAuthToken(
          loginResponse.data!.token,
          loginResponse.data!.refreshToken,
        );
        return Right(loginResponse.data!);
      } else {
        return Left(Exception());
      }
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      return Left(BoxtingException(statusCode: code));
    } catch (e) {
      return Left(BoxtingException(statusCode: unknownError));
    }
  }

  @override
  Future<bool> registerUser(RegisterRequest registerRequest) async {
    try {
      final registerResponse = await boxtingClient.register(registerRequest);
      return registerResponse.success;
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<DefaultResponse> sendForgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    try {
      return await boxtingClient.sendForgotPassword(forgotPasswordRequest);
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<DefaultResponse> setNewPassword(
    NewPasswordRequest newPasswordRequest,
  ) async {
    try {
      return await boxtingClient.setNewPassword(newPasswordRequest);
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<DefaultResponse> validatePasswordToken(
    ValidateTokenRequest validateTokenRequest,
  ) async {
    try {
      return await boxtingClient.validatePasswordToken(validateTokenRequest);
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<UserResponse> getUserInformation() async {
    try {
      return await boxtingClient.getUserInformation();
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<void> saveFirstTimeLogin() async {
    final box = await Hive.openBox<bool>(Constants.hiveBoxName);
    await box.put(Constants.firstLogin, false);
  }

  Future<void> _saveAuthToken(String token, String refreshToken) async {
    await _secureStorage.write(key: Constants.authToken, value: token);
    await _secureStorage.write(
      key: Constants.authRefreshToken,
      value: refreshToken,
    );
  }

  @override
  Future<void> updateUserInformation(UpdateProfileRequest request) async {
    try {
      await boxtingClient.updateProfile(request);
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }

  @override
  Future<void> refreshToken() async {
    try {
      final token = await _secureStorage.read(key: Constants.authToken);
      final refresh = await _secureStorage.read(
        key: Constants.authRefreshToken,
      );
      final request = RefreshTokenRequest(token!, refresh!);
      final response = await boxtingClient.refreshToken(request);
      await _secureStorage.write(
        key: Constants.authToken,
        value: response.data,
      );
    } on DioException catch (e) {
      final code = e.response?.statusCode?.orDefaultErrorCode();
      throw BoxtingException(statusCode: code);
    } catch (e) {
      throw BoxtingException(statusCode: unknownError);
    }
  }
}
