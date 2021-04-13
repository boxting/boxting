import 'package:boxting/features/biometric/biometric_screen.dart';
import 'package:boxting/features/faq/faq_screen.dart';
import 'package:boxting/features/settings/providers.dart';
import 'package:boxting/features/terms/terms_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends HookWidget {
  static Future navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(loadBiometricProvider);
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: provider.when(
            loading: () => BoxtingLoadingScreen(),
            data: (enabled) => SettingsScreenBody(biometricEnabled: enabled),
            error: (e, _) => BoxtingErrorScreen(e.toString()),
          )),
    );
  }
}

class SettingsScreenBody extends HookWidget {
  final bool biometricEnabled;

  const SettingsScreenBody({Key key, this.biometricEnabled}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final biometricMessage = biometricEnabled
        ? 'Elimina tu huella digital como medio para autenticarte'
        : 'Agrega tu huella digital como medio para autenticarte';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Configuración', style: titleTextStyle),
          SizedBox(height: 48),
          ListTile(
            leading: Icon(Icons.fingerprint),
            title: Text('Biometria'),
            subtitle: Text(biometricMessage),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => setBiometricInformation(context, biometricEnabled),
          ),
          ListTile(
            leading: Icon(Icons.language_rounded),
            title: Text('Idiomas'),
            subtitle: Text('Define el idioma de la aplicación'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.text_format_sharp),
            title: Text('Terminos y condiciones'),
            subtitle:
                Text('Conoce los terminos y condiciones de la aplicación'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => BoxtingNavigation.goto(context, (_) => TermsScreen()),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Preguntas frecuentes'),
            subtitle: Text(
              'Conoce las respuestas a las preguntas más frecuentes acerca de la aplicación',
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => BoxtingNavigation.goto(context, (_) => FaqScreen()),
          ),
          const Spacer(),
          BoxtingVersion(),
        ],
      ),
    );
  }

  void setBiometricInformation(BuildContext context, bool enabled) async {
    if (enabled) {
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        title: '¿Estas seguro?',
        text: '¿Desea eliminar la huella registrada?',
        confirmBtnText: 'Sí',
        cancelBtnText: 'No',
        onConfirmBtnTap: () async {
          await context.read(setBioInformationProvider(false));
          await BoxtingNavigation.pop(context);
        },
        confirmBtnColor: Colors.green,
      );
    } else {
      await BiometricScreen.navigate(context);
    }
  }
}

class BoxtingVersion extends HookWidget {
  final provider = useProvider(packageProvider);
  @override
  Widget build(BuildContext context) {
    return provider.when(
      loading: () => CircularProgressIndicator(),
      data: (version) => Center(
        child: RichText(
          text: TextSpan(
            text: 'Versión ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: version,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      error: (e, _) => Text('Error'),
    );
  }
}
