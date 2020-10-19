abstract class SettingsRepository {
  Future<bool> isFingerprintLoginEnabled();
  Future<void> setFingerprintLogin(bool enabled);
}
