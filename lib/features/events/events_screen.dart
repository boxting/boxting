import 'package:boxting/features/events/event_item.dart';
import 'package:boxting/features/events/events_bloc.dart';
import 'package:boxting/features/events/subscribe/subscribe_event_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class EventsScreen extends HookWidget {
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<EventsBloc>()..fetchEvents(),
      child: EventsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<EventsBloc>();
    if (bloc.events != null) {
      return BoxtingScaffold(
        appBar: BoxtingAppBar(),
        body: Center(child: EventListBody()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => SubscribeEventScreen.navigate(context),
          child: Icon(Icons.add),
        ),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}

class EventListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = context.watch<EventsBloc>().events;
    if (events.isEmpty) {
      return BoxtingEmptyScreen(
          'Aún no estas registrado en ningún evento de votación');
    } else {
      return Column(
        children: [
          Text('Las siguientes votaciones son:'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (_, int index) => EventItem(
                  event: events[index],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
