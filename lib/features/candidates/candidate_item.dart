import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:flutter/material.dart';

class CandidateItem extends StatelessWidget {
  final CandidateResponseData candidate;

  final IMAGE_SIZE = 48.0;
  final NOT_AVAILABLE_IMAGE =
      'https://corp.sellerscommerce.com//SCAssets/images/noimage.png';
  const CandidateItem({Key key, this.candidate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            candidate.list.imageUrl ?? NOT_AVAILABLE_IMAGE,
            height: IMAGE_SIZE,
            width: IMAGE_SIZE,
          ),
          SizedBox(width: 16),
          Image.network(
            candidate.imageUrl ?? NOT_AVAILABLE_IMAGE,
            height: IMAGE_SIZE,
            width: IMAGE_SIZE,
          ),
        ],
      ),
      title: Text('${candidate.firstName} ${candidate.lastName}'),
      subtitle: Text(candidate.list.name),
    );
  }
}
