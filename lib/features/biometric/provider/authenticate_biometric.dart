import 'package:boxting/data/repository/repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authenticate_biometric.g.dart';

@riverpod
class AuthenticateBiometric extends _$AuthenticateBiometric {
  @override
  FutureOr<bool> build({String reason = ''}) async {
    final _auth = ref.watch(localAuthenticationProvider);
    final _repository = ref.read(biometricRepositoryProvider);
    final _canCheckBiometrics = await _repository.canCheckBiometrics;

    final _availableBiometrics = await _auth.getAvailableBiometrics();
    if (_availableBiometrics.contains(BiometricType.fingerprint) &&
        _canCheckBiometrics) {
      final authenticated = await _auth.authenticate(localizedReason: reason);
      return authenticated;
    }
    return false;
  }
}
