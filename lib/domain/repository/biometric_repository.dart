abstract class BiometricRepository {
  Future<bool> isFingerprintLoginEnabled();
  Future<void> setFingerprintLogin(bool enabled);
}
