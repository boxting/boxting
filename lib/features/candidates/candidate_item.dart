import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/detail/candidate_detail_screen.dart';
import 'package:flutter/material.dart';

class CandidateItem extends StatelessWidget {
  final CandidateResponseData candidate;

  final IMAGE_SIZE = 48.0;
  const CandidateItem({Key key, this.candidate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            candidate.list.imageUrl,
            height: IMAGE_SIZE,
            width: IMAGE_SIZE,
          ),
          SizedBox(width: 16),
          Image.network(
            candidate.imageUrl,
            height: IMAGE_SIZE,
            width: IMAGE_SIZE,
          ),
        ],
      ),
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
