import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:introduction_screen/introduction_screen.dart';

// import 'onboarding_pages.dart';

class OnBoardingScreen extends HookWidget {
  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => OnBoardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 16.0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    Widget _buildImage(String assetName) {
      return Align(
        child: Image.asset('assets/images/onboarding/$assetName.png',
            width: 350.0),
        alignment: Alignment.bottomCenter,
      );
    }

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Bienvenido a la mejor solución de votación.',
          body: 'Emite tus votos de forma rápida y segura',
          decoration: pageDecoration,
          image: _buildImage('boxtingphone'),
        ),
        PageViewModel(
          title: 'Investiga acerca de tus candidatos antes de votar',
          body: 'Conoce la información acerca de tus candidatos',
          decoration: pageDecoration,
          image: _buildImage('peoplevote'),
        ),
        PageViewModel(
          title: 'Identificate de manera digital',
          body: 'Asegura tu voto utilizando tu huella digital',
          decoration: pageDecoration,
          image: _buildImage('virtualidentity'),
        ),
      ],
      onDone: () => LoginScreen.navigate(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Saltar'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Listo', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
