import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessVote extends StatelessWidget {
  final double width;
  final double height;

  const SuccessVote({Key key, this.width = 300, this.height = 300})
      : super(key: key);
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
