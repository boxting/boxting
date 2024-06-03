import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class BoxtingErrorScreen extends HookWidget {
  final String message;

  const BoxtingErrorScreen(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/lottie/error_cone.json',
          width: 240,
          height: 240,
          fit: BoxFit.fill,
        ),
        Text(message),
        const SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: BoxtingButton(
            backgroudColor: Colors.red,
            onPressed: () => LoginScreen.navigate(context),
            child: const Text('Volver a ingresar'),
          ),
        )
      ],
    );
  }
}
