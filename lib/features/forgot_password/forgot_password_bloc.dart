import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBloc extends ChangeNotifier {
  final AuthRepository authRepository;
  ForgotPasswordBloc({@required this.authRepository});

  String _forgotPasswordMail;
  String get forgotPasswordMail => _forgotPasswordMail;

  String _forgotPasswordToken;
  String get forgotPasswordToken => _forgotPasswordToken;

  void forgotPassword(String mail) async {
    try {
      await authRepository.sendForgotPassword(mail);
      _forgotPasswordMail = mail;
    } catch (e) {
      throw Exception(e);
    }
  }

  void verifyCode(String token) async {
    try {
      await authRepository.validatePasswordToken(_forgotPasswordMail, token);
      _forgotPasswordToken = token;
    } catch (e) {
      throw Exception(e);
    }
  }

  void createNewPassword(String password) async {
    try {
      await authRepository.setNewPassword(
        _forgotPasswordMail,
        _forgotPasswordToken,
        password,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
