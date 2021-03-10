import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider.dart';

class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderListener<AsyncValue<bool>>(
      provider: firstTimeOpenProvider,
      onChange: (context, result) async {
        if (result.data.value) {
          await OnBoardingScreen.navigate(context);
        } else {
          await LoginScreen.navigate(context);
        }
      },
      child: BoxtingScaffold(
        body: Center(
          child: Image.asset(
            'assets/images/icons/boxting_icon_white.png',
            height: 128,
            width: 128,
          ),
        ),
      ),
    );
  }
}
