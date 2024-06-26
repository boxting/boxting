import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessVote extends StatelessWidget {

  const SuccessVote({super.key, this.width = 300, this.height = 300});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/vote_success.json',
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
