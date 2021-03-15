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
      print(e);
    }
  }

  Future<void> authenticate({
    VoidCallback onSuccess,
    FailureCallback onFailure,
  }) async {
    try {
      final authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      if (authenticated) {
        await onSuccess();
      } else {
        throw PlatformException(code: 'La autenticación fallo');
      }
    } on PlatformException catch (e) {
      await onFailure(e);
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
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
