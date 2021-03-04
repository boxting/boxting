import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'splash_bloc.dart';

class SplashScreen extends HookWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloc(),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SplashBloc>();
    useEffect(() {
      Future.microtask(() async {
        try {
          await Future.delayed(Duration(seconds: 1));
          await provider.isFirstTimeOpen();
          if (provider.isFirstTime) {
            await OnBoardingScreen.navigate(context);
          } else {
            await LoginScreen.navigate(context);
          }
        } catch (_) {
          await OnBoardingScreen.navigate(context);
        }
      });
      return;
    });
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
