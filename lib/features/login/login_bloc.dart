import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';

import 'package:flutter/material.dart';

enum LoginState { initial, loading, error }

class LoginBloc extends ChangeNotifier {
  final AuthRepository authRepository;
  final BiometricRepository settingsRepository;
  var loginState = LoginState.initial;

  BoxtingFailure _boxtingFailure;
  BoxtingFailure get failure => _boxtingFailure;

  LoginBloc({
    @required this.authRepository,
    @required this.settingsRepository,
  });

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> loadBiometricInformation() async {
    return await settingsRepository.isFingerprintLoginEnabled();
  }

  Future<bool> isFirstTimeLogin() async =>
      await authRepository.isFirstTimeLogin();

  Future<bool> login() async {
    try {
      _boxtingFailure = null;
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await authRepository.login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
      loginState = LoginState.initial;
      notifyListeners();

      return loginResponse;
    } on BoxtingFailure catch (e) {
      loginState = LoginState.initial;
      _boxtingFailure = e;
      notifyListeners();
      return false;
    }
  }
}
