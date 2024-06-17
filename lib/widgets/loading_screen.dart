import 'package:boxting/widgets/loading_vote.dart';
import 'package:flutter/material.dart';

class BoxtingLoadingScreen extends StatelessWidget {
  const BoxtingLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingVote(),
    );
  }
}
