import 'package:boxting/features/events/events_bloc.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class EventsScreen extends HookWidget {
  EventsScreen._();
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventsBloc(),
      builder: (_, __) => EventsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(),
      ),
    );
  }
}
