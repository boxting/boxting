import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBloc extends ChangeNotifier {
  final AuthRepository authRepository;
  ForgotPasswordBloc({@required this.authRepository});

  void forgotPassword(String email) async {
    try {
      await authRepository.sendForgotPassword(email);
    } catch (e) {
      throw Exception(e);
    }
  }
}
