import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBloc extends ChangeNotifier {
  ForgotPasswordBloc({required this.authRepository});
  final AuthRepository authRepository;

  late String _forgotPasswordMail;
  String get forgotPasswordMail => _forgotPasswordMail;

  late String _forgotPasswordToken;
  String get forgotPasswordToken => _forgotPasswordToken;

  Future<void> forgotPassword(String mail) async {
    try {
      final request = ForgotPasswordRequest(mail: mail);
      await authRepository.sendForgotPassword(request);
      _forgotPasswordMail = mail;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> verifyCode(String token) async {
    try {
      final request = ValidateTokenRequest(
        mail: _forgotPasswordMail,
        token: token,
      );
      await authRepository.validatePasswordToken(request);
      _forgotPasswordToken = token;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> createNewPassword(String password) async {
    try {
      final request = NewPasswordRequest(
        mail: _forgotPasswordMail,
        token: _forgotPasswordToken,
        newPassword: password,
      );
      await authRepository.setNewPassword(request);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
