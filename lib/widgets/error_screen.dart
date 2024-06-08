import 'package:boxting/features/login/login_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class BoxtingErrorScreen extends HookWidget {
  const BoxtingErrorScreen(this.message, {super.key});
  final String message;

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
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: BoxtingButton(
            backgroudColor: Colors.red,
            onPressed: () => context.goNamed(LoginScreen.name),
            child: const Text('Volver a ingresar'),
          ),
        ),
      ],
    );
  }
}
