import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BoxtingLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading_vote.json',
        width: 300,
        height: 300,
        fit: BoxFit.fill,
      ),
    );
  }
}
