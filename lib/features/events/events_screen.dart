import 'package:boxting/features/events/event_item.dart';
import 'package:boxting/features/events/providers.dart';
import 'package:boxting/features/events/subscribe/subscribe_event_screen.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: RefreshIndicator(
        onRefresh: () => context.refresh(fetchUserEventsProvider),
        child: EventListBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SubscribeEventScreen.navigate(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class EventListBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(fetchUserEventsProvider);

    return provider.when(
      loading: () => BoxtingLoadingScreen(),
      data: (events) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: events.isEmpty
            ? Center(child: BoxtingEmptyScreen('No hay eventos disponibles'))
            : Column(
                children: [
                  Text('Tus siguientes votaciones son:', style: titleTextStyle),
                  SizedBox(height: 48),
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
