import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/elections/detail/election_detail.dart';
import 'package:flutter/material.dart';

class ElectionItem extends StatelessWidget {
  final ElectionResponseData election;
  final String event;

  const ElectionItem({Key key, this.election, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ElectionDetailScreen.navigate(
        context,
        event,
        election.id.toString(),
      ),
      child: Card(
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
      ),
    );
  }
}
