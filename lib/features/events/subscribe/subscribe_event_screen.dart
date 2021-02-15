import 'package:boxting/domain/repository/event_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../events_bloc.dart';

class SubscribeEventScreen extends HookWidget {
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventsBloc(getIt.get<EventRepository>()),
      builder: (_, __) => SubscribeEventScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (_) => SubscribeEventScreen.init(context));
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final accessCodeController = useTextEditingController();
    final eventCodeController = useTextEditingController();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Suscribete a un nuevo evento de votación'),
              BoxtingInput(
                controller: eventCodeController,
                labelText: 'Código del evento',
                validator: (value) =>
                    value.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              BoxtingInput(
                controller: accessCodeController,
                labelText: 'Código de acceso',
                validator: (value) =>
                    value.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              BoxtingButton(
                child: Text('Suscribirse'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async {
                        final bloc = context.read<EventsBloc>();
                        await bloc.subsribeEvent(
                          eventCodeController.text.trim(),
                          accessCodeController.text.trim(),
                        );
                      },
                      onSuccess: () {},
                      onError: (e) => BoxtingModal.show(
                        context,
                        title: 'Error',
                        message: e.message,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
