import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessAnimation extends StatelessWidget {

  const SuccessAnimation({super.key, this.width = 300, this.height = 300});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/success.json',
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
