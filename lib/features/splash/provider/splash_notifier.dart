import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/features/splash/provider/splash_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier(
    AuthRepository authRepository,
  )   : _authRepository = authRepository,
        super(const SplashInitial());

  final AuthRepository _authRepository;

  Future<void> isFirstTimeOpen() async {
    final isFirstTimeOpen = await _authRepository.isFirstTimeLogin();
    if (isFirstTimeOpen) {
      state = SplashToOnBoarding();
    } else {
      state = SplashToLogin();
    }
  }
}
