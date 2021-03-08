import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/domain/repository/candidates_repository.dart';
import 'package:boxting/features/candidates/candidate_item.dart';
import 'package:boxting/features/candidates/candidates_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CandidatesScreen extends StatelessWidget {
  final String electionId;

  const CandidatesScreen({Key key, this.electionId}) : super(key: key);
  static Widget init(BuildContext context, String election) {
    return ChangeNotifierProvider(
      create: (_) => CandidatesBloc(getIt.get<CandidatesRepository>()),
      builder: (_, __) => CandidatesScreen(electionId: election),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CandidatesBloc>();
    return FutureBuilder<List<CandidateResponseData>>(
      future: bloc.fetchCandidatesByElection(electionId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return BoxtingLoadingScreen();
        return CandidatesScreenBody(candidates: snapshot.data);
      },
    );
  }
}

class CandidatesScreenBody extends StatelessWidget {
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
