import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/features/biometric/provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class BiometricNotifier extends StateNotifier<BiometricState> {
  BiometricNotifier({
    required this.biometricRepository,
    required this.localAuthentication,
  }) : super(const BiometricInitial());

  final BiometricRepository biometricRepository;
  final LocalAuthentication localAuthentication;

  Future<void> authenticate() async {
    final authenticated = await localAuthentication.authenticate(
      localizedReason: 'Scan your fingerprint to authenticate',
    );
    if (authenticated) {
      state = const BiometricSuccess();
    } else {
      throw PlatformException(code: 'La autenticación fallo');
    }
  }
}
