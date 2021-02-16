import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';

import 'package:flutter/material.dart';

class LoginBloc extends ChangeNotifier {
  final AuthRepository authRepository;
  final BiometricRepository biometricRepository;

  BoxtingException _boxtingFailure;
  BoxtingException get failure => _boxtingFailure;

  LoginBloc({
    @required this.authRepository,
    @required this.biometricRepository,
  });

  Future<bool> loadBiometricInformation() async {
    return await biometricRepository.isFingerprintLoginEnabled();
  }

  Future<bool> isFirstTimeLogin() async =>
      await authRepository.isFirstTimeLogin();

  Future<void> login(String username, String password) async {
    try {
      final loginRequest = LoginRequest(username: username, password: password);
      await authRepository.login(loginRequest);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
