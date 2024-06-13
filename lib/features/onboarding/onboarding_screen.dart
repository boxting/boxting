import 'package:boxting/features/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends HookWidget {
  const OnBoardingScreen({super.key});

  static const route = '/on_boarding';
  static const name = 'on_boarding_screen';

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    final introKey = GlobalKey();

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: 'Bienvenido a la mejor solución de votación.',
          body: 'Emite tus votos de forma rápida y segura',
          decoration: pageDecoration,
          image: _ImagePageViewModel(assetName: 'boxtingphone'),
        ),
        PageViewModel(
          title: 'Investiga acerca de tus candidatos antes de votar',
          body: 'Conoce la información acerca de tus candidatos',
          decoration: pageDecoration,
          image: _ImagePageViewModel(assetName: 'peoplevote'),
        ),
        PageViewModel(
          title: 'Identificate de manera digital',
          body: 'Asegura tu voto utilizando tu huella digital',
          decoration: pageDecoration,
          image: _ImagePageViewModel(assetName: 'virtualidentity'),
        ),
      ],
      onDone: () => context.goNamed(LoginScreen.name),
      showSkipButton: true,
      nextFlex: 0,
      skip: const Text('Saltar'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Listo', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}

class _ImagePageViewModel extends StatelessWidget {
  const _ImagePageViewModel({required this.assetName});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/images/onboarding/$assetName.png',
        width: 350,
      ),
    );
  }
}
