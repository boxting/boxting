import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:flutter/material.dart';

class ElectionItem extends StatelessWidget {
  final ElectionResponseData election;

  const ElectionItem({Key key, this.election}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(election.name),
            Text(election.information),
            Text('Puede haber ${election.winners} ganadores')
          ],
        ),
      ),
    );
  }
}
