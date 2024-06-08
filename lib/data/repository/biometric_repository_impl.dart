import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:hive/hive.dart';

class BiometricRepositoryImpl implements BiometricRepository {
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
}
