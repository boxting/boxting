import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class BiometricScreen extends HookWidget {
  BiometricScreen._({this.comesFromSetting = true});
  final bool comesFromSetting;

  static Widget init(BuildContext context, bool settings) {
    return ChangeNotifierProvider.value(
      value: getIt.get<BiometricBloc>(),
      builder: (_, __) => BiometricScreen._(comesFromSetting: settings),
    );
  }

  static Future<void> navigate(BuildContext context,
      {bool settings = false}) async {
    await BoxtingNavigation.goto(
        context, (_) => BiometricScreen.init(context, settings));
  }

  @override
  Widget build(BuildContext context) {
    final _isAuthenticating = useState<bool>(false);
    final bloc = context.watch<BiometricBloc>();

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
              ),
              SizedBox(height: 32),
              BoxtingButton(
                child: Text(
                  _isAuthenticating.value ? 'Cargando' : 'Autenticar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await bloc.checkBiometrics();
                  await bloc.getAvailableBiometrics();
                  if (_isAuthenticating.value) {
                    bloc.cancelAuthentication();
                  } else {
                    await bloc.authenticate(
                      context: context,
                      onSuccess: () => CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        title: 'Perfecto',
                        text: 'Tu huella digital ha sido validada',
                        confirmBtnText: 'Continuar',
                        onConfirmBtnTap: () => bloc.goToHomeScreen(
                          context,
                          dialog: true,
                          comesFromSettings: comesFromSetting,
                        ),
                      ),
                      onFailure: (PlatformException e) => CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          title: 'Algo salio mal',
                          text: e.message,
                          onConfirmBtnTap: () {
                            BoxtingNavigation.pop(context);
                            _isAuthenticating.value = false;
                          }),
                    );
                  }
                },
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () => bloc.goToHomeScreen(context),
                child: Text('Omitir por ahora'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
