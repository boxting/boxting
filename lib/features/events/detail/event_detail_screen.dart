import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/features/elections/elections_screen.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class EventDetailScreen extends HookWidget {
  final String eventId;

  EventDetailScreen({this.eventId});

  static Future<void> navigate(BuildContext context, String id) async {
    await BoxtingNavigation.goto(
        context, (_) => EventDetailScreen(eventId: id));
  }

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(fetchEventByIdProvider(eventId));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(
        trailing: IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) => SettingsModalBody(eventId: eventId),
          ),
          icon: Icon(Icons.settings),
        ),
      ),
      body: Center(
        child: provider.when(
          loading: () => BoxtingLoadingScreen(),
          data: (event) => EventDetailBody(event: event),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class EventDetailBody extends HookWidget {
  final EventResponseData event;
  const EventDetailBody({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startDate = event.startDate.toDetailDate();
    final endDate = event.endDate.toDetailDate();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(event.name, style: titleTextStyle),
          SizedBox(height: 24),
          Text('Evento ${event.code}', style: subTitleTextStyle),
          SizedBox(height: 24),
          Text(event.information),
          SizedBox(height: 24),
          Text('$startDate - $endDate'),
          const SizedBox(height: 24),
          Expanded(child: ElectionsScreen(eventId: event.id.toString()))
        ],
      ),
    );
  }
}

class SettingsModalBody extends HookWidget {
  final String eventId;
  SettingsModalBody({this.eventId});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Eliminar subscribción al evento de votación'),
          leading: Icon(Icons.delete, color: Colors.red),
          onTap: () async => await CoolAlert.show(
            context: context,
            type: CoolAlertType.confirm,
            title: '¿Estas seguro?',
            text: '¿Desea eliminar su suscripción al evento de votación?',
            confirmBtnText: 'Sí',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () async {
              await BoxtingNavigation.pop(context);
              await BoxtingLoadingDialog.show(
                context,
                futureBuilder: () async {
                  await context.read(removeUserFromEventProvider(eventId));
                },
                onSuccess: () => BoxtingNavigation.gotoRoot(context),
                onError: (e) => BoxtingModal.show(
                  context,
                  title: 'Error',
                  message: e,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
