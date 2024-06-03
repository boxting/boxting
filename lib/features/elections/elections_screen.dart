import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/features/elections/providers.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'election_item.dart';

class ElectionsScreen extends HookConsumerWidget {
  final String eventId;
  final num eventStatus;

  const ElectionsScreen({
    super.key,
    required this.eventId,
    required this.eventStatus,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(electionsFromEventProvider(eventId));
    return provider.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => BoxtingErrorScreen(e.toString()),
      data: (data) => ElectionsScreenBody(
        election: data,
        eventId: eventId,
        eventStatus: eventStatus,
      ),
    );
  }
}

class ElectionsScreenBody extends HookWidget {
  final ElectionResponseData election;
  final String eventId;
  final num eventStatus;

  const ElectionsScreenBody({
    required this.election,
    required this.eventId,
    required this.eventStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (election.elements.isEmpty) {
      return const BoxtingEmptyScreen('No hay elecciones aún.');
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
