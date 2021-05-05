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

  ElectionDetailScreen({this.eventId, this.electionId});

  static Future<void> navigate(
    BuildContext context,
    String event,
    String election,
  ) async {
    await BoxtingNavigation.goto(context,
        (_) => ElectionDetailScreen(eventId: event, electionId: election));
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
        data: (data) => ElectionScreenBody(election: data),
      ),
    );
  }
}

class ElectionScreenBody extends StatelessWidget {
  final ElectionElementResponseData election;

  const ElectionScreenBody({Key key, this.election}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BoxtingButton.outline(
                      child: Text('Ver resultados'),
                      onPressed: () => ResultsScreen.navigate(
                          context, election.id.toString()),
                    ),
                    SizedBox(width: 20),
                    BoxtingButton.outline(
                      child: Text('Ver mi voto'),
                      onPressed: () => MyVoteScreen.navigate(
                          context, election.id.toString()),
                    ),
                  ],
                )
              : BoxtingButton(
                  child: Text('Ir a votar'),
                  onPressed: () =>
                      VotingScreen.navigate(context, election.id.toString()),
                ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
