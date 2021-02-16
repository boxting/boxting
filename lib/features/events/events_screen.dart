import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:boxting/features/events/event_item.dart';
import 'package:boxting/features/events/events_bloc.dart';
import 'package:boxting/features/events/subscribe/subscribe_event_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
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
      body: FutureBuilder(
        future: bloc.fetchEvents(),
        builder: (_, __) {
          if (bloc.events != null) {
            return Center(child: EventListBody(events: bloc.events));
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
    if (events.isNotEmpty) {
      return EmptyEventList();
    } else {
      return Column(
        children: [
          Text('Las siguientes votaciones son:'),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (_, int index) => EventItem(event: events[index]),
            ),
          ),
        ],
      );
    }
  }
}

class EmptyEventList extends StatelessWidget {
  const EmptyEventList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/lottie/sad_empty_box.json',
          width: 240,
          height: 240,
          fit: BoxFit.fill,
        ),
        Text('Aún no estas registrado en ningún evento de votación')
      ],
    );
  }
}
