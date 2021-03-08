import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/domain/repository/candidates_repository.dart';
import 'package:boxting/features/candidates/candidates_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CandidateDetailScreen extends StatelessWidget {
  final String candidateId;
  final String listId;

  const CandidateDetailScreen({Key key, this.candidateId, this.listId})
      : super(key: key);

  static Widget init(BuildContext context, String candidate, String list) {
    return ChangeNotifierProvider(
      create: (_) => CandidatesBloc(getIt.get<CandidatesRepository>()),
      builder: (_, __) => CandidateDetailScreen(
        candidateId: candidate,
        listId: list,
      ),
    );
  }

  static Future<void> navigate(
    BuildContext context,
    String candidate,
    String list,
  ) async {
    await BoxtingNavigation.goto(
        context, (_) => CandidateDetailScreen.init(context, candidate, list));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CandidatesBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<CandidateResponseData>(
          future: bloc.fetchCandidateById(candidateId, listId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return BoxtingLoadingScreen();
            return CandidateDetailBody(candidate: snapshot.data);
          },
        ),
      ),
    );
  }
}

class CandidateDetailBody extends StatelessWidget {
  final CandidateResponseData candidate;

  const CandidateDetailBody({Key key, this.candidate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${candidate.lastName}, ${candidate.firstName}'),
        Text(candidate.information),
      ],
    );
  }
}
