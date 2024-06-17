import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:flutter/material.dart';

class CandidateItem extends StatelessWidget {
  const CandidateItem({required this.candidate, super.key});
  final CandidateElementResponseData candidate;

  @override
  Widget build(BuildContext context) {
    const imageSize = 48.0;
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            candidate.list.imageUrl,
            height: imageSize,
            width: imageSize,
          ),
          const SizedBox(width: 16),
          Image.network(
            candidate.imageUrl,
            height: imageSize,
            width: imageSize,
          ),
        ],
      ),
      title: Text('${candidate.firstName} ${candidate.lastName}'),
      subtitle: Text(candidate.list.name),
    );
  }
}
