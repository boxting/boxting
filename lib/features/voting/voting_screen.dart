import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/providers.dart';
import 'package:boxting/widgets/boxting_appbar.dart';
import 'package:boxting/widgets/loading_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VotingScreen extends HookWidget {
  final String election;

  VotingScreen(this.election);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(fetchCandidateByElection(election));
    return provider.when(
      data: (data) => VotingScreenBody(data),
      loading: () => BoxtingLoadingScreen(),
      error: (e, _) => BoxtingErrorScreen(e.toString()),
    );
  }
}

class VotingScreenBody extends HookWidget {
  final List<CandidateResponseData> candidates;

  VotingScreenBody(this.candidates);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
