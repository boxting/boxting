import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/providers.dart';
import 'package:boxting/features/voting/providers.dart';
import 'package:boxting/features/voting/selectable_candidate.dart';
import 'package:boxting/features/voting/sucess_voting_screen.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VotingScreen extends HookConsumerWidget {
  const VotingScreen(this.election, this.winners, this.event, {super.key});
  final String election;
  final String event;
  final num winners;

  static Future<void> navigate(
    BuildContext context,
    String election,
    num winners,
    String event,
  ) async {
    await BoxtingNavigation.goto(
      context,
      (_) => VotingScreen(election, winners, event),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(fetchCandidateByElection(election));
    return provider.when(
      data: (data) => VotingScreenBody(data.elements, election, winners, event),
      loading: () => const BoxtingLoadingScreen(),
      error: (e, _) => BoxtingErrorScreen(e.toString()),
    );
  }
}

class VotingScreenBody extends HookConsumerWidget {
  const VotingScreenBody(
    this.candidates,
    this.electionId,
    this.winners,
    this.event, {
    super.key,
  });
  final List<CandidateElementResponseData> candidates;
  final String electionId;
  final String event;
  final num winners;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCandidates = useState<List<String>>([]);
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Elige a tu candidato', style: titleTextStyle),
            Text(
              'Debes elegir $winners candidato(s)',
              style: subTitleTextStyle,
            ),
            const SizedBox(height: 48),
            Expanded(
              child: ListView.builder(
                itemCount: candidates.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    if (selectedCandidates.value
                        .contains(candidates[index].id.toString())) {
                      selectedCandidates.value = [selectedCandidates.value]
                          .expand((x) => x)
                          .toList()
                        ..remove(candidates[index].id.toString());
                    } else {
                      selectedCandidates.value = [
                        selectedCandidates.value,
                        [candidates[index].id.toString()],
                      ].expand((x) => x).toList();
                    }
                  },
                  child: SelectableCandidate(
                    CandidateUiModel(
                      isSelected: selectedCandidates.value
                          .contains(candidates[index].id.toString()),
                      candidate: candidates[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            BoxtingButton(
              onPressed: selectedCandidates.value.length == winners
                  ? () async => BoxtingLoadingDialog.show(
                        context,
                        futureBuilder: () async {
                          final request = VoteRequest(
                            selectedCandidates.value,
                            electionId,
                            event,
                          );
                          await ref
                              .read(votingElectionProvider.notifier)
                              .emitVote(request);
                        },
                        onSuccess: () => SuccessVotingScreen.navigate(context),
                        onError: (e) async => BoxtingModal.show(
                          context,
                          title: 'Ocurrio un error!',
                          message: 'No se pudo emitir tu voto.',
                        ),
                      )
                  : null,
              child: const Text('Votar'),
            ),
          ],
        ),
      ),
    );
  }
}
