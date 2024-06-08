import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/features/login/provider/login_notifier.dart';
import 'package:boxting/features/login/provider/provider.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final biometricRepository = ref.watch(biometricRepositoryProvider);
  return LoginNotifier(authRepository, biometricRepository);
});
