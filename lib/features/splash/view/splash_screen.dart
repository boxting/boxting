import 'package:boxting/features/login/view/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/features/splash/provider/provider.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  static const route = '/splash';
  static const name = 'splash_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen(
          splashNotifierProvider,
          (_, state) async {
            if (state.value is SplashToOnBoarding) {
              context.goNamed(OnBoardingScreen.name);
            }

            if (state.value is SplashToLogin) {
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
      },
    );
  }
}
