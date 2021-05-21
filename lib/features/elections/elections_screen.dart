import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/elections/providers.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'election_item.dart';

class ElectionsScreen extends HookWidget {
  final String eventId;
  final num eventStatus;

  const ElectionsScreen({Key key, this.eventId, this.eventStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(electionsFromEventProvider(eventId));
    return provider.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, _) => BoxtingErrorScreen(e.toString()),
      data: (data) => ElectionsScreenBody(data, eventId, eventStatus),
    );
  }
}

class ElectionsScreenBody extends HookWidget {
  final ElectionResponseData election;
  final String eventId;
  final num eventStatus;

  const ElectionsScreenBody(this.election, this.eventId, this.eventStatus,
      {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (election.elements.isEmpty) {
      return BoxtingEmptyScreen('No hay elecciones aún.');
    }
    return ListView.builder(
      itemCount: election.elements.length,
      itemBuilder: (_, index) => ElectionItem(
        election: election.elements[index],
        eventId: eventId,
        eventStatus: eventStatus,
      ),
    );
  }
}
