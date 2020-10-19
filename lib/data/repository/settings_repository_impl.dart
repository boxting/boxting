import 'package:boxting/domain/repository/settings_repository.dart';
import 'package:hive/hive.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<bool> isFingerprintLoginEnabled() async {
    var box = await Hive.openBox('BoxtingBox');
    var fingerprintLogin =
        box.get('fingerprintLoginEnabled', defaultValue: false);
    return fingerprintLogin;
  }

  @override
  Future<void> setFingerprintLogin(bool enabled) async {
    var box = await Hive.openBox('BoxtingBox');
    await box.put('fingerprintLoginEnabled', enabled);
  }
}
