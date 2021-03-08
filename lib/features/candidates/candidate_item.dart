import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:flutter/material.dart';

class CandidateItem extends StatelessWidget {
  final CandidateResponseData candidate;

  const CandidateItem({Key key, this.candidate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(candidate.toString());
    return ListTile(
      title: Text('${candidate.firstName} ${candidate.lastName}'),
      subtitle: Text(candidate.list.name),
    );
  }
}
