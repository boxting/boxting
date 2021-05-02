import 'package:boxting/features/settings/providers.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BiometricScreen extends HookWidget {
  static Future<void> navigate(
    BuildContext context,
  ) async {
    await BoxtingNavigation.goto(context, (_) => BiometricScreen());
  }

  @override
  Widget build(BuildContext context) {
    // final fingerProvider = useProvider(fingerBioIsAvailableProvider);

    final size = MediaQuery.of(context).size;
    return BoxtingScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/biometric/biometric_login.png',
                width: size.width,
                height: size.height * 0.4,
              ),
              Center(
                child: Text(
                  'Asegura tu voto utilizando tu huella digital!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ingresa a la aplicación utilizando tu huella digital y realizado '
                'todo de manera más rapida y segura. Recuerda que puedes modificar '
                'tu accesso con huella digital dentro de Configuración > Biometria',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 32),
              BoxtingButton(
                child: Text(
                  'Autenticar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  final localAuth = context.read(localAuthProvider);
                  final result = await localAuth.authenticateWithBiometrics(
                    localizedReason:
                        'Escanea tu huella digital para autenticarte',
                    useErrorDialogs: true,
                    stickyAuth: true,
                  );
                  if (result) {
                    await CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        title: 'Perfecto',
                        text: 'Tu huella digital ha sido validada',
                        barrierDismissible: false,
                        confirmBtnText: 'Continuar',
                        onConfirmBtnTap: () async {
                          context.read(setBioInformationProvider(true));
                          await BoxtingNavigation.gotoRoot(context);
                        });
                  } else {
                    await CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        barrierDismissible: false,
                        title: 'Algo salio mal',
                        text: 'No se pudo validar tu huella',
                        onConfirmBtnTap: () {
                          BoxtingNavigation.pop(context);
                        });
                  }
                },
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () => BoxtingNavigation.pop(context),
                child: Text('Omitir por ahora'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
