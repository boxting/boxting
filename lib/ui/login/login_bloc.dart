import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/login_repository.dart';
import 'package:boxting/domain/repository/settings_repository.dart';
import 'package:flutter/material.dart';

enum LoginState { initial, loading, error }

class LoginBloc extends ChangeNotifier {
  final LoginRepository loginRepository;
  final SettingsRepository settingsRepository;
  var loginState = LoginState.initial;

  BoxtingFailure _boxtingFailure;
  BoxtingFailure get failure => _boxtingFailure;

  LoginBloc({
    @required this.loginRepository,
    @required this.settingsRepository,
  });

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> loadBiometricInformation() async {
    return await settingsRepository.isFingerprintLoginEnabled();
  }

  Future<bool> login() async {
    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await loginRepository.login(
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
