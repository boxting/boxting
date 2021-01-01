import 'package:boxting/domain/repository/settings_repository.dart';
import 'package:flutter/material.dart';

enum BiometricState { initial, loading }

class BiometricBloc extends ChangeNotifier {
  final SettingsRepository repository;

  BiometricBloc({@required this.repository});

  Future<void> setBiometricInformation(bool enabled) async {
    await repository.setFingerprintLogin(enabled);
  }
}
