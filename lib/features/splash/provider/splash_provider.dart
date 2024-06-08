import 'package:boxting/features/splash/provider/provider.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) {
    final authenticationRepository = ref.watch(authRepositoryProvider);
    return SplashNotifier(authenticationRepository);
  },
);
