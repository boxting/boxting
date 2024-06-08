import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/candidates/candidate_screen.dart';

import 'package:boxting/features/elections/providers.dart';
import 'package:boxting/features/my_vote/my_vote_screen.dart';
import 'package:boxting/features/results/results_screen.dart';
import 'package:boxting/features/voting/voting_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ElectionDetailScreen extends HookConsumerWidget {
  const ElectionDetailScreen({
    required this.eventId,
    required this.electionId,
    required this.eventStatus,
    super.key,
  });
  final String eventId;
  final String electionId;
  final num eventStatus;

  static Future<void> navigate(
    BuildContext context,
    String event,
    String election,
    num eventStatus,
  ) async {
    await BoxtingNavigation.goto(
      context,
      (_) => ElectionDetailScreen(
        eventId: event,
        electionId: election,
        eventStatus: eventStatus,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final request = ElectionDetailRequest(eventId, electionId);
    final provider = ref.watch(electionDetailProvider(request));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: provider.when(
        loading: () => const BoxtingLoadingScreen(),
        error: (e, _) => BoxtingErrorScreen(e.toString()),
        data: (data) => ElectionScreenBody(
          election: data,
          eventStatus: eventStatus,
          event: eventId,
        ),
      ),
    );
  }
}

class ElectionScreenBody extends StatelessWidget {
  const ElectionScreenBody({
    required this.election,
    required this.eventStatus,
    required this.event,
    super.key,
  });
  final ElectionElementResponseData election;
  final num eventStatus;
  final String event;

  @override
  Widget build(BuildContext context) {
    final isEventReady = eventStatus == 2;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(election.name, style: titleTextStyle),
          const SizedBox(height: 8),
          Text(election.information, style: subTitleTextStyle),
          const SizedBox(height: 24),
          Text('Esta elección puede tener ${election.winners} ganador(es)'),
          const SizedBox(height: 20),
          Expanded(child: CandidatesScreen(electionId: election.id.toString())),
          const SizedBox(height: 24),
          if (election.userVoted)
            _ResultsOptions(election: election, eventStatus: eventStatus)
          else
            BoxtingButton(
              onPressed: isEventReady
                  ? () => VotingScreen.navigate(
                        context,
                        election.id.toString(),
                        election.winners,
                        event,
                      )
                  : null,
              child: Text(
                isEventReady ? 'Ir a votar' : 'Elección no disponible',
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ResultsOptions extends StatelessWidget {
  const _ResultsOptions({
    required this.election,
    required this.eventStatus,
  });

  final ElectionElementResponseData election;
  final num eventStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (eventStatus == 3)
          BoxtingButton.outline(
            child: const Text('Ver resultados'),
            onPressed: () =>
                ResultsScreen.navigate(context, election.id.toString()),
          ),
        const SizedBox(width: 20),
        BoxtingButton.outline(
          child: const Text('Ver mi voto'),
          onPressed: () =>
              MyVoteScreen.navigate(context, election.id.toString()),
        ),
      ],
    );
  }
}
