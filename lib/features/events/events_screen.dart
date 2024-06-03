import 'package:boxting/features/events/event_item.dart';
import 'package:boxting/features/events/providers.dart';
import 'package:boxting/features/events/subscribe/subscribe_event_screen.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventsScreen extends HookConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(isRoot: true),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(fetchUserEventsProvider.future),
        child: const EventListBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SubscribeEventScreen.navigate(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EventListBody extends HookConsumerWidget {
  const EventListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(fetchUserEventsProvider);

    return provider.when(
      loading: () => const BoxtingLoadingScreen(),
      data: (events) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: events.isEmpty
            ? const Center(
                child: BoxtingEmptyScreen('No hay eventos disponibles'))
            : Column(
                children: [
                  const Text('Tus siguientes votaciones son:',
                      style: titleTextStyle),
                  const SizedBox(height: 48),
                  Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (_, int index) =>
                          EventItem(event: events[index]),
                    ),
                  ),
                ],
              ),
      ),
      error: (e, st) => Center(child: BoxtingErrorScreen(e.toString())),
    );
  }
}
