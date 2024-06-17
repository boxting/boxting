import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class BoxtingEmptyScreen extends HookWidget {

  const BoxtingEmptyScreen(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/sad_empty_box.json',
            width: 240,
            height: 240,
            fit: BoxFit.fill,
          ),
          Text(message),
        ],
      ),
    );
  }
}
