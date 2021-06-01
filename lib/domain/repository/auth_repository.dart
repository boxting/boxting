import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/network/request/refresh_token_request/refresh_token_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';

abstract class AuthRepository {
  Future<bool> login(LoginRequest loginRequest);
  Future<bool> isFirstTimeLogin();
  Future<bool> registerUser(RegisterRequest registerRequest);
  Future<DniResponseData> fetchInformationFromReniec(String dni);
  Future<DefaultResponse> sendForgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
  Future<DefaultResponse> validatePasswordToken(
    ValidateTokenRequest validateTokenRequest,
  );
  Future<DefaultResponse> setNewPassword(NewPasswordRequest newPasswordRequest);
  Future<UserResponse> getUserInformation();
  Future<void> saveFirstTimeLogin();
  Future<void> updateUserInformation(UpdateProfileRequest request);
  Future<void> refreshToken(RefreshTokenRequest request);
}
