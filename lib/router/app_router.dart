import 'package:boxting/features/login/view/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/features/splash/splash.dart';

import 'package:go_router/go_router.dart';

class BoxtingRouter {
  static final router = GoRouter(
    initialLocation: SplashScreen.route,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: SplashScreen.route,
        name: SplashScreen.name,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: OnBoardingScreen.route,
        name: OnBoardingScreen.name,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: LoginScreen.route,
        name: LoginScreen.name,
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
}
