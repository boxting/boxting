import 'package:boxting/features/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';

import 'onboarding_model.dart';
import 'onboarding_pages.dart';

class OnBoardingScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: OnboardingPages(
          bgColor: Colors.white,
          themeColor: Theme.of(context).primaryColor,
          pages: pages,
          skipClicked: (value) => goToLoginScreen(context),
          getStartedClicked: (value) => goToLoginScreen(context),
        ),
      ),
    );
  }

  void goToLoginScreen(BuildContext context) async {
    var box = await Hive.openBox('onboarding');
    box.put('firstTime', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen.init(context),
      ),
    );
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
