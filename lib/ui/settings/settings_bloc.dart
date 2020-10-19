import 'package:boxting/domain/repository/settings_repository.dart';
import 'package:flutter/material.dart';

enum SettingsState { loading, success }

class SettingsBloc extends ChangeNotifier {
  var settingsState = SettingsState.loading;
  final SettingsRepository repository;

  SettingsBloc({@required this.repository});

  Future<bool> loadBiometricInformation() async {
    return await repository.isFingerprintLoginEnabled();
  }

  Future<void> setBiometricInformation(bool enabled) async {
    await repository.setFingerprintLogin(enabled);
  }
}
