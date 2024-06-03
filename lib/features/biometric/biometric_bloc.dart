import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

typedef FailureCallback = void Function(PlatformException e);

class BiometricBloc extends ChangeNotifier {
  final BiometricRepository repository;
  final LocalAuthentication auth;

  BiometricBloc(this.repository, this.auth);

  Future<void> checkBiometrics() async {
    try {
      await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> authenticate({
    required VoidCallback onSuccess,
    required FailureCallback onFailure,
  }) async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
      );
      if (authenticated) {
        onSuccess();
      } else {
        throw PlatformException(code: 'La autenticación fallo');
      }
    } on PlatformException catch (e) {
      onFailure(e);
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }
}

final fingerBioIsAvailableProvider = FutureProvider<bool>((ref) async {
  final localAuth = ref.watch(localAuthProvider);
  final biometrics = await localAuth.getAvailableBiometrics();
  return biometrics.contains(BiometricType.fingerprint);
});

final setFirstLoginProvider = FutureProvider<void>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.saveFirstTimeLogin();
});
