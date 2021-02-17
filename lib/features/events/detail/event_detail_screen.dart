import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../events_bloc.dart';

class EventDetailScreen extends HookWidget {
  final String eventId;

  EventDetailScreen({this.eventId});

  static Widget init(BuildContext context, String id) {
    return ChangeNotifierProvider(
      create: (_) => EventsBloc(getIt.get<EventRepository>()),
      builder: (_, __) => EventDetailScreen(
        eventId: id,
      ),
    );
  }

  static Future<void> navigate(BuildContext context, String id) async {
    await BoxtingNavigation.goto(
        context, (_) => EventDetailScreen.init(context, id));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<EventsBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: FutureBuilder<EventResponseData>(
        future: bloc.fetchEventById(eventId),
        builder: (_, event) {
          if (event.hasData) {
            return EventDetailBody(event: event.data);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class EventDetailBody extends StatelessWidget {
  final EventResponseData event;

  const EventDetailBody({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(event.name),
          Text(event.information),
          Text(event.code),
          Text('${event.startDate} - ${event.endDate}')
        ],
      ),
    );
  }
}
