import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/features/login/provider/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(
    AuthRepository authRepository,
    BiometricRepository biometricRepository,
  )   : _authRepository = authRepository,
        _biometricRepository = biometricRepository,
        super(LoginInitial());

  final AuthRepository _authRepository;
  final BiometricRepository _biometricRepository;

  Future<void> login(String username, String password) async {
    final loginRequest = LoginRequest(username: username, password: password);
    state = LoginLoading();
    final result = await _authRepository.login(loginRequest);
    state = await result.fold(
      (failure) => LoginFailure(),
      (data) => LoginSuccess(),
    );
  }
}
