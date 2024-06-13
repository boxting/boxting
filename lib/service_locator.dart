import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_locator.g.dart';

@riverpod
FlutterSecureStorage secureStorage(SecureStorageRef ref) {
  return FlutterSecureStorage();
}

@riverpod
LocalAuthentication localAuthentication(LocalAuthenticationRef ref) {
  return LocalAuthentication();
}

// void _setupBlocs() {
//   getIt
//     ..registerSingleton<ForgotPasswordBloc>(
//       ForgotPasswordBloc(authRepository: getIt.get<AuthRepository>()),
//     )
//     ..registerSingleton<RegisterBloc>(
//       RegisterBloc(authRepository: getIt.get<AuthRepository>()),
//     );
// }
