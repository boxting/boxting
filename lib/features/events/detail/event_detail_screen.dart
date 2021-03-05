import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:boxting/features/events/detail/elections/elections_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
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
      builder: (_, __) => EventDetailScreen(eventId: id),
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
      appBar: BoxtingAppBar(
        trailing: IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) => SettingsModalBody.init(context, eventId),
          ),
          icon: Icon(Icons.settings),
        ),
      ),
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

class EventDetailBody extends HookWidget {
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
          Text('${event.startDate} - ${event.endDate}'),
          const SizedBox(height: 24),
          Expanded(child: ElectionsScreen.init(context, event.id.toString())),
        ],
      ),
    );
  }
}

class SettingsModalBody extends StatelessWidget {
  final String eventId;
  SettingsModalBody({this.eventId});

  static Widget init(BuildContext context, String id) {
    return ChangeNotifierProvider(
      create: (_) => EventsBloc(getIt.get<EventRepository>()),
      builder: (_, __) => SettingsModalBody(
        eventId: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<EventsBloc>();
    return ListView(
      children: [
        ListTile(
          title: Text('Eliminar subscribción al evento'),
          leading: Icon(Icons.delete, color: Colors.red),
          onTap: () async => await BoxtingLoadingDialog.show(
            context,
            futureBuilder: () => bloc.unsubscribeFromEvent(eventId),
            onSuccess: () => BoxtingNavigation.gotoRoot(context),
            onError: (e) => BoxtingModal.show(
              context,
              title: 'Error',
              message: e,
            ),
          ),
        )
      ],
    );
  }
}
