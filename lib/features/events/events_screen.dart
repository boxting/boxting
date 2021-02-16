import 'package:boxting/domain/repository/event_repository.dart';
import 'package:boxting/features/events/events_bloc.dart';
import 'package:boxting/features/events/subscribe/subscribe_event_screen.dart';
import 'package:boxting/service_locator.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text('Las siguientes votaciones son:'),
            Expanded(
              child: FutureBuilder(
                future: bloc.fetchEvents(),
                builder: (_, __) {
                  if (bloc.events != null) {
                    return ListView.builder(
                      itemCount: bloc.events.length,
                      itemBuilder: (_, int index) => Text(
                        bloc.events[index].code,
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SubscribeEventScreen.navigate(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
