import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:hive/hive.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  @override
  Future<bool> isFingerprintLoginEnabled() async {
    var box = await Hive.openBox(Constants.hiveBoxName);
    var fingerprintLogin = box.get(
      Constants.fingerPrintEnabled,
      defaultValue: false,
    );
    return fingerprintLogin;
  }

  @override
  Future<void> setFingerprintLogin(bool enabled) async {
    var box = await Hive.openBox(Constants.hiveBoxName);
    await box.put(Constants.fingerPrintEnabled, enabled);
  }
}
