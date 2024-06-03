import 'package:flutter/material.dart';

import 'loading_vote.dart';

class BoxtingLoadingScreen extends StatelessWidget {
  const BoxtingLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingVote(),
    );
  }
}
