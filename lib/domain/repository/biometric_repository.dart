import 'package:local_auth/local_auth.dart';

abstract class BiometricRepository {
  Future<bool> isFingerprintLoginEnabled();
  Future<bool> authenticateBiometrics({required String reason});
  Future<void> setFingerprintLogin({required bool enabled});
  void cancelBiometricAuthentication();
  Future<List<BiometricType>> getAvailableBiometrics();
  Future<bool> get canCheckBiometrics;
}
