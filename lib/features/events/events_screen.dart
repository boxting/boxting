import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/domain/repository/event_repository.dart';
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
    return ChangeNotifierProvider(
      create: (_) => EventsBloc(getIt.get<EventRepository>()),
      builder: (_, __) => EventsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<EventsBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: FutureBuilder<List<EventResponseData>>(
        future: bloc.fetchEvents(),
        builder: (_, events) {
          if (events.hasData) {
            return Center(child: EventListBody(events: events.data));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SubscribeEventScreen.navigate(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class EventListBody extends StatelessWidget {
  final List<EventResponseData> events;

  const EventListBody({Key key, this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return BoxtingEmptyScreen(
        'Aún no estas registrado en ningún evento de votación',
      );
    } else {
      return Column(
        children: [
          Text('Las siguientes votaciones son:'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (_, int index) => EventItem(event: events[index]),
              ),
            ),
          ),
        ],
      );
    }
  }
}
