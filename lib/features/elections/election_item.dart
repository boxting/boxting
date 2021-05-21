import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/elections/detail/election_detail.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:flutter/material.dart';

class ElectionItem extends StatelessWidget {
  final ElectionElementResponseData election;
  final String eventId;
  final num eventStatus;

  const ElectionItem({
    Key key,
    this.election,
    this.eventId,
    this.eventStatus,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userVotedState = election.userVoted
        ? 'Elección con voto cumplido'
        : 'Aún no has emitido tu voto';
    return InkWell(
      onTap: () => ElectionDetailScreen.navigate(
        context,
        eventId,
        election.id.toString(),
        eventStatus,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(election.name, style: subTitleTextStyle),
              Text(election.information),
              Text('Puede haber ${election.winners} ganadores'),
              const SizedBox(height: 16),
              Text(
                userVotedState,
                style: TextStyle(
                  color: election.userVoted ? Colors.green : Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
