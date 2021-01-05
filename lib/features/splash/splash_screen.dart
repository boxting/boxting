import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/features/onboarding/onboarding_screen.dart';
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen.init(context),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen.init(context),
              ),
            );
          }
        } catch (_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => OnBoardingScreen(),
            ),
          );
        }
      });
      return;
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/boxting_logo.png',
          height: 256,
          width: 256,
        ),
      ),
    );
  }
}
