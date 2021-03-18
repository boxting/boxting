import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/candidate_item.dart';
import 'package:boxting/features/candidates/providers.dart';
import 'package:boxting/widgets/boxting_appbar.dart';
import 'package:boxting/widgets/loading_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VotingScreen extends HookWidget {
  final String election;

  VotingScreen(this.election);

  static Future<void> navigate(BuildContext context, String election) async {
    await BoxtingNavigation.goto(context, (_) => VotingScreen(election));
  }

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
  final selectedCandidate = useState(-1);

  VotingScreenBody(this.candidates);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Elige a tu candidato', style: titleTextStyle),
            SizedBox(height: 48),
            Expanded(
              child: ListView.builder(
                itemCount: candidates.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => selectedCandidate.value = index,
                  child: SelectableCandidate(
                    CandidateUiModel(
                      isSelected: selectedCandidate.value == index,
                      candidate: candidates[index],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            BoxtingButton(
              child: Text('Votar'),
              onPressed: selectedCandidate.value != -1 ? () {} : null,
            )
          ],
        ),
      ),
    );
  }
}

class SelectableCandidate extends HookWidget {
  final CandidateUiModel candidateUiModel;

  SelectableCandidate(this.candidateUiModel);

  @override
  Widget build(BuildContext context) {
    final borderColor = candidateUiModel.isSelected
        ? Theme.of(context).primaryColor
        : Colors.transparent;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: CandidateItem(candidate: candidateUiModel.candidate)
    );
  }
}

class CandidateUiModel {
  final bool isSelected;
  final CandidateResponseData candidate;

  CandidateUiModel({this.isSelected, this.candidate});
}
