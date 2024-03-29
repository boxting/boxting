import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/candidates/candidate_screen.dart';

import 'package:boxting/features/elections/providers.dart';
import 'package:boxting/features/my_vote/my_vote_screen.dart';
import 'package:boxting/features/results/results_screen.dart';
import 'package:boxting/features/voting/voting_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ElectionDetailScreen extends HookWidget {
  final String eventId;
  final String electionId;
  final num eventStatus;

  ElectionDetailScreen({this.eventId, this.electionId, this.eventStatus});

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
  Widget build(BuildContext context) {
    final request = ElectionDetailRequest(eventId, electionId);
    final provider = useProvider(electionDetailProvider(request));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: provider.when(
        loading: () => BoxtingLoadingScreen(),
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
  final ElectionElementResponseData election;
  final num eventStatus;
  final String event;

  const ElectionScreenBody({
    Key key,
    this.election,
    this.eventStatus,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEventReady = eventStatus == 2;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(election.name, style: titleTextStyle),
          SizedBox(height: 8),
          Text(election.information, style: subTitleTextStyle),
          SizedBox(height: 24),
          Text('Esta elección puede tener ${election.winners} ganador(es)'),
          SizedBox(height: 20),
          Expanded(child: CandidatesScreen(electionId: election.id.toString())),
          SizedBox(height: 24),
          election.userVoted
              ? _ResultsOptions(election: election, eventStatus: eventStatus)
              : BoxtingButton(
                  child: Text(
                    isEventReady ? 'Ir a votar' : 'Elección no disponible',
                  ),
                  onPressed: isEventReady
                      ? () => VotingScreen.navigate(
                            context,
                            election.id.toString(),
                            election.winners,
                            event,
                          )
                      : null,
                ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ResultsOptions extends StatelessWidget {
  const _ResultsOptions({
    Key key,
    @required this.election,
    this.eventStatus,
  }) : super(key: key);

  final ElectionElementResponseData election;
  final num eventStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (eventStatus == 3)
          BoxtingButton.outline(
            child: Text('Ver resultados'),
            onPressed: () =>
                ResultsScreen.navigate(context, election.id.toString()),
          ),
        SizedBox(width: 20),
        BoxtingButton.outline(
          child: Text('Ver mi voto'),
          onPressed: () =>
              MyVoteScreen.navigate(context, election.id.toString()),
        ),
      ],
    );
  }
}
