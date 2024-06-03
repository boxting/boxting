import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/refresh_token_request/refresh_token_request.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginBloc extends ChangeNotifier {
  final AuthRepository authRepository;
  final BiometricRepository biometricRepository;

  late BoxtingException _boxtingFailure;
  BoxtingException get failure => _boxtingFailure;

  LoginBloc({
    required this.authRepository,
    required this.biometricRepository,
  });

  Future<bool> loadBiometricInformation() async {
    return await biometricRepository.isFingerprintLoginEnabled();
  }

  Future<bool> isFirstTimeLogin() async =>
      await authRepository.isFirstTimeLogin();

  Future<void> setFirstLogin() async =>
      await biometricRepository.setFingerprintLogin(false);

  Future<void> login(String username, String password) async {
    try {
      final loginRequest = LoginRequest(username: username, password: password);
      await authRepository.login(loginRequest);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> refreshToken() async {
    try {
      final secureStorage = getIt.get<FlutterSecureStorage>();
      final token = await secureStorage.read(key: Constants.authToken);
      final refresh = await secureStorage.read(key: Constants.authRefreshToken);
      final request = RefreshTokenRequest(token!, refresh!);
      await authRepository.refreshToken(request);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}

final isFirstTimeLoginProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  return repository.isFirstTimeLogin();
});
