import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

enum BiometricState { initial, loading }

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
    BuildContext context,
    VoidCallback onSuccess,
    FailureCallback onFailure,
  }) async {
    var authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      if (authenticated) {
        await _setBiometricInformation(authenticated);
        onSuccess();
      } else {
        throw PlatformException(code: 'La autenticación fallo');
      }
    } on PlatformException catch (e) {
      onFailure(e);
    }
  }

  void goToHomeScreen(
    BuildContext context, {
    bool dialog = false,
    bool comesFromSettings = false,
  }) {
    if (comesFromSettings) {
      if (dialog) BoxtingNavigation.pop(context);
      BoxtingNavigation.pop(context);
    } else {
      if (dialog) BoxtingNavigation.pop(context);
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

  Future<void> _setBiometricInformation(bool enabled) async {
    await repository.setFingerprintLogin(enabled);
  }
}
