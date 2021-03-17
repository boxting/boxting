import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/candidates/candidate_screen.dart';

import 'package:boxting/features/elections/providers.dart';
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
  final ElectionResponseData election;

  const ElectionScreenBody({Key key, this.election}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(election.name, style: titleTextStyle),
          Text(election.information, style: subTitleTextStyle),
          Text(election.winners.toString()),
          SizedBox(height: 20),
          Expanded(child: CandidatesScreen(electionId: election.id.toString())),
          SizedBox(height: 20),
          BoxtingButton(
            child: Text('Ir a votar'),
            onPressed: () => null,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
