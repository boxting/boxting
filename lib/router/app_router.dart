import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class BoxtingRouter {
  static final router = GoRouter(
    initialLocation: SplashScreen.route,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: SplashScreen.route,
        name: SplashScreen.name,
      ),
      GoRoute(
        path: OnBoardingScreen.route,
        name: OnBoardingScreen.name,
      ),
      GoRoute(
        path: LoginScreen.route,
        name: LoginScreen.name,
      ),
    ],
  );
}
