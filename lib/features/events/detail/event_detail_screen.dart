import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/features/elections/elections_screen.dart';
import 'package:boxting/features/events/providers.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventDetailScreen extends HookConsumerWidget {

  const EventDetailScreen({required this.eventId, super.key});
  final String eventId;

  static Future<void> navigate(BuildContext context, String id) async {
    await BoxtingNavigation.goto(
        context, (_) => EventDetailScreen(eventId: id),);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(fetchEventByIdProvider(eventId));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(
        trailing: IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) => SettingsModalBody(eventId: eventId),
          ),
          icon: const Icon(Icons.settings),
        ),
      ),
      body: Center(
        child: provider.when(
          loading: () => const BoxtingLoadingScreen(),
          data: (event) => EventDetailBody(event: event),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class EventDetailBody extends HookWidget {
  const EventDetailBody({required this.event, super.key});
  final EventResponseData event;

  @override
  Widget build(BuildContext context) {
    final startDate = event.startDate.toDetailDate();
    final endDate = event.endDate.toDetailDate();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(event.name, style: titleTextStyle),
          const SizedBox(height: 24),
          Text('Evento ${event.code}', style: subTitleTextStyle),
          const SizedBox(height: 24),
          Text(event.information),
          const SizedBox(height: 24),
          Text('$startDate - $endDate'),
          const SizedBox(height: 24),
          Text('Estado del evento: ${event.status}'),
          const SizedBox(height: 24),
          Expanded(
            child: ElectionsScreen(
              eventId: event.id.toString(),
              eventStatus: event.eventStatus,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsModalBody extends HookWidget {
  const SettingsModalBody({required this.eventId, super.key});
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('Eliminar suscripción al evento de votación'),
          leading: Icon(Icons.delete, color: Colors.red),
          // onTap: () async => await CoolAlert.show(
          //   context: context,
          //   type: CoolAlertType.confirm,
          //   title: 'Alerta',
          //   barrierDismissible: false,
          //   text: '¿Desea eliminar su suscripción al evento de votación?',
          //   confirmBtnText: 'Sí',
          //   cancelBtnText: 'No',
          //   confirmBtnColor: Colors.green,
          //   onConfirmBtnTap: () async {
          //     BoxtingNavigation.pop(context);
          //     await BoxtingLoadingDialog.show(
          //       context,
          //       futureBuilder: () async {
          //         await context.read(removeUserFromEventProvider(eventId));
          //       },
          //       onSuccess: () => BoxtingNavigation.gotoRoot(context),
          //       onError: (e) => BoxtingModal.show(
          //         context,
          //         title: 'Error',
          //         message: e,
          //       ),
          //     );
          //   },
          // ),
        ),
      ],
    );
  }
}
