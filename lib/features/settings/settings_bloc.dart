import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:flutter/material.dart';

enum SettingsState { loading, success }

class SettingsBloc extends ChangeNotifier {
  var settingsState = SettingsState.loading;
  final BiometricRepository repository;

  SettingsBloc({@required this.repository});

  Future<bool> loadBiometricInformation() async {
    return await repository.isFingerprintLoginEnabled();
  }

  Future<void> setBiometricInformation(bool enabled) async {
    await repository.setFingerprintLogin(enabled);
  }
}
