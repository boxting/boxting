import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'biometric_repository_impl.g.dart';

@riverpod
BiometricRepository biometricRepository(BiometricRepositoryRef ref) {
  final localAuthentication = ref.read(localAuthenticationProvider);
  return BiometricRepositoryImpl(localAuthentication: localAuthentication);
}

class BiometricRepositoryImpl implements BiometricRepository {
  BiometricRepositoryImpl({
    required LocalAuthentication localAuthentication,
  }) : _localAuthentication = localAuthentication;

  final LocalAuthentication _localAuthentication;

  @override
  Future<bool> isFingerprintLoginEnabled() async {
    final box = await Hive.openBox<bool>(Constants.hiveBoxName);
    final fingerprintLogin = box.get(
          Constants.fingerPrintEnabled,
          defaultValue: false,
        ) ??
        false;
    return fingerprintLogin;
  }

  @override
  Future<void> setFingerprintLogin({required bool enabled}) async {
    final box = await Hive.openBox<bool>(Constants.hiveBoxName);
    await box.put(Constants.fingerPrintEnabled, enabled);
  }

  @override
  Future<bool> authenticateBiometrics({String reason = ''}) async {
    final authenticated = await _localAuthentication.authenticate(
      localizedReason: reason,
    );
    return authenticated;
  }

  @override
  Future<bool> get canCheckBiometrics async =>
      await _localAuthentication.canCheckBiometrics;

  @override
  void cancelBiometricAuthentication() =>
      _localAuthentication.stopAuthentication();

  @override
  Future<List<BiometricType>> getAvailableBiometrics() {
    return _localAuthentication.getAvailableBiometrics();
  }
}
