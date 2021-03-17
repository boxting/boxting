import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/candidate_item.dart';
import 'package:boxting/features/candidates/providers.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CandidatesScreen extends HookWidget {
  final String electionId;

  const CandidatesScreen({Key key, this.electionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(fetchCandidateByElection(electionId));
    return provider.when(
      data: (data) => CandidatesScreenBody(candidates: data),
      loading: () => BoxtingLoadingScreen(),
      error: (e, _) => BoxtingErrorScreen(e.toString()),
    );
  }
}

class CandidatesScreenBody extends HookWidget {
  final List<CandidateResponseData> candidates;

  const CandidatesScreenBody({Key key, this.candidates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (candidates.isEmpty) return BoxtingEmptyScreen('Aún no hay candidatos');
    return ListView.builder(
      itemCount: candidates.length,
      itemBuilder: (_, index) => CandidateItem(candidate: candidates[index]),
    );
  }
}
