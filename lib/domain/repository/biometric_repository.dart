abstract class BiometricRepository {
  Future<bool> isFingerprintLoginEnabled();
  Future<void> setFingerprintLogin({required bool enabled});
}
