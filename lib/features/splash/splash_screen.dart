import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      firstTimeOpenProvider,
      (prev, next) async {
        if (next.valueOrNull ?? true) {
          OnBoardingScreen.navigate(context);
        } else {
          LoginScreen.navigate(context);
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
