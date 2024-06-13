import 'package:boxting/data/repository/repository.dart';
import 'package:boxting/features/splash/provider/provider.dart';
import 'package:boxting/features/splash/provider/splash_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  FutureOr<SplashState?> build() async {
    try {
      state = const AsyncLoading();
      final _authRepository = ref.read(authRepositoryProvider);
      final isFirstTimeOpen = await _authRepository.isFirstTimeLogin();

      if (isFirstTimeOpen) {
        state = AsyncData(SplashToOnBoarding());
      } else {
        state = AsyncData(SplashToLogin());
      }
      return state.value;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return state.value;
    }
  }
}
