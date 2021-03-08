import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/detail/candidate_detail_screen.dart';
import 'package:flutter/material.dart';

class CandidateItem extends StatelessWidget {
  final CandidateResponseData candidate;

  const CandidateItem({Key key, this.candidate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => CandidateDetailScreen.navigate(
        context,
        candidate.id.toString(),
        candidate.listId.toString(),
      ),
      title: Text('${candidate.firstName} ${candidate.lastName}'),
      subtitle: Text(candidate.list.name),
    );
  }
}
