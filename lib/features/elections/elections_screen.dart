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

  const ElectionsScreen({Key key, this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(electionsFromEventProvider(eventId));
    return provider.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, _) => BoxtingErrorScreen(e.toString()),
      data: (data) => ElectionsScreenBody(data, eventId),
    );
  }
}

class ElectionsScreenBody extends HookWidget {
  final List<ElectionResponseData> elections;
  final String eventId;

  const ElectionsScreenBody(this.elections, this.eventId, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (elections.isEmpty) return BoxtingEmptyScreen('No hay elecciones aún.');
    return ListView.builder(
      itemCount: elections.length,
      itemBuilder: (_, index) => ElectionItem(
        election: elections[index],
        event: eventId,
      ),
    );
  }
}
