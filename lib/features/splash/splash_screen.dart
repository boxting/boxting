import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/features/splash/provider/provider.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  static const route = '/';
  static const name = 'splash_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      splashProvider,
      (_, state) async {
        if (state is SplashToOnBoarding) {
          context.goNamed(OnBoardingScreen.name);
        } else {
          context.goNamed(LoginScreen.name);
        }
      },
    );

    return BoxtingScaffold(
      body: Center(
        child: Image.asset(
          'assets/images/icons/boxting_icon_white.png',
          height: 128,
          width: 128,
        ),
      ),
    );
  }
}
