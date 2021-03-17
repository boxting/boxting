import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/providers.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CandidateDetailScreen extends HookWidget {
  final String candidateId;
  final String listId;

  const CandidateDetailScreen({Key key, this.candidateId, this.listId})
      : super(key: key);

  static Future<void> navigate(
    BuildContext context,
    String candidate,
    String list,
  ) async {
    await BoxtingNavigation.goto(context,
        (_) => CandidateDetailScreen(candidateId: candidate, listId: list));
  }

  @override
  Widget build(BuildContext context) {
    final request = CandidateDetailRequest(candidateId, listId);
    final provider = useProvider(fetchCandidateById(request));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: provider.when(
        data: (data) => CandidateDetailBody(candidate: data),
        loading: () => BoxtingLoadingScreen(),
        error: (e, _) => BoxtingErrorScreen(e.toString()),
      ),
    );
  }
}

class CandidateDetailBody extends HookWidget {
  final CandidateResponseData candidate;

  const CandidateDetailBody({Key key, this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('${candidate.lastName}, ${candidate.firstName}'),
          Text(candidate.information),
        ],
      ),
    );
  }
}
