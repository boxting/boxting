import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class SubscribeEventScreen extends HookWidget {
  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => SubscribeEventScreen());
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
              Text(
                'Suscribete a un nuevo evento de votación',
                style: titleTextStyle,
              ),
              const SizedBox(height: 48),
              BoxtingInput(
                controller: eventCodeController,
                labelText: 'Código del evento',
                validator: (value) =>
                    value.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              const SizedBox(height: 24),
              BoxtingInput(
                controller: accessCodeController,
                labelText: 'Código de acceso',
                validator: (value) =>
                    value.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              const SizedBox(height: 48),
              BoxtingButton(
                child: Text('Suscribirse'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async {
                        final request = SubscribeEventRequest(
                          eventCode: eventCodeController.text.trim(),
                          accessCode: accessCodeController.text.trim(),
                        );
                        await context
                            .read(subscribeEventProvider)
                            .subscribe(request);
                      },
                      onSuccess: () async {
                        await CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          title: 'Felicidades',
                          barrierDismissible: false,
                          text: 'Se ha suscrito al evento de votación',
                          confirmBtnText: 'Ok',
                          confirmBtnColor: Colors.green,
                          onConfirmBtnTap: () => BoxtingNavigation.pop(context),
                        );
                        await BoxtingNavigation.pop(context);
                      },
                      onError: (e) async => await BoxtingModal.show(
                        context,
                        title: 'Error',
                        message: e,
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
