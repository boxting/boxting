import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:boxting/features/elections/elections_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ElectionDetailScreen extends HookWidget {
  final String eventId;
  final String electionId;

  ElectionDetailScreen({this.eventId, this.electionId});

  static Future<void> navigate(
    BuildContext context,
    String event,
    String election,
  ) async {
    await BoxtingNavigation.goto(
        context, (_) => ElectionDetailScreen.init(context, event, election));
  }

  static Widget init(BuildContext context, String event, String election) {
    return ChangeNotifierProvider(
      create: (_) => ElectionsBloc(getIt.get<ElectionsRepository>()),
      builder: (_, __) => ElectionDetailScreen(
        eventId: event,
        electionId: election,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ElectionsBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<SingleElectionResponse>(
          future: bloc.fetchElectionById(eventId, electionId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return BoxtingLoadingScreen();
            return ElectionScreenBody(election: snapshot.data.data);
          },
        ),
      ),
    );
  }
}

class ElectionScreenBody extends StatelessWidget {
  final ElectionResponseData election;

  const ElectionScreenBody({Key key, this.election}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(election.name),
        Text(election.information),
        Text(election.winners.toString())
      ],
    );
  }
}
