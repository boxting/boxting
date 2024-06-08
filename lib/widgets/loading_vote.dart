import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingVote extends StatelessWidget {

  const LoadingVote({super.key, this.width = 300, this.height = 300});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/loading_vote.json',
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
