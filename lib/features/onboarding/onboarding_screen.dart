import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';

import 'onboarding_model.dart';
// import 'onboarding_pages.dart';

class OnBoardingScreen extends HookWidget {
  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => OnBoardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: OnboardingPages(
      //     bgColor: Colors.white,
      //     themeColor: Theme.of(context).primaryColor,
      //     pages: pages,
      //     skipClicked: (value) => goToLoginScreen(context),
      //     getStartedClicked: (value) => goToLoginScreen(context),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BoxtingButton(
          child: Text('Fix on borading'),
          onPressed: () => goToLoginScreen(context),
        ),
      ),
    );
  }

  void goToLoginScreen(BuildContext context) async {
    var box = await Hive.openBox('onboarding');
    await box.put('firstTime', false);
    await BoxtingNavigation.replace(context, (_) => LoginScreen.init(context));
  }

  final pages = <OnboardingModel>[
    OnboardingModel(
      title: 'Bienvenido a la mejor solución de votación.',
      description: 'Emite tus votos de forma rápida y segura',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'assets/images/onboarding/boxtingphone.png',
    ),
    OnboardingModel(
      title: 'Investiga acerca de tus candidatos antes de votar',
      description: 'Conoce la información acerca de tus candidatos',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'assets/images/onboarding/peoplevote.png',
    ),
    OnboardingModel(
      title: 'Identificate de manera digital',
      description: 'Asegura tu voto utilizando tu huella digital',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'assets/images/onboarding/virtualidentity.png',
    ),
  ];
}
