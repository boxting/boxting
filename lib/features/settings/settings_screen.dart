import 'package:boxting/data/repository/settings_repository_impl.dart';
import 'package:boxting/features/biometric/biometric_screen.dart';
import 'package:boxting/features/faq/faq_screen.dart';
import 'package:boxting/features/settings/settings_bloc.dart';
import 'package:boxting/features/terms/terms_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen._();
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsBloc(repository: SettingsRepositoryImpl())
        ..loadBiometricInformation(),
      builder: (_, __) => SettingsScreen._(),
    );
  }

  void setBiometricInformation(BuildContext context, bool enabled) async {
    final bloc = context.read<SettingsBloc>();
    if (enabled) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BiometricScreen.init(context, settings: true),
        ),
      );
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "Quieres eliminar tu huella de la aplicación?",
        confirmBtnText: "Sí",
        cancelBtnText: "No",
        onConfirmBtnTap: () {
          Navigator.pop(context);
          bloc.setBiometricInformation(enabled);
        },
        confirmBtnColor: Colors.green,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SettingsBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: bloc.loadBiometricInformation(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Perfil'),
                  subtitle:
                      Text('Configura tus elementos personales acerca de tí.'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                snapshot.data
                    ? ListTile(
                        leading: Icon(Icons.fingerprint),
                        title: Text('Biometria'),
                        subtitle: Text(
                            'Elimina tu huella digital como medio para autenticarte'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => setBiometricInformation(context, false),
                      )
                    : ListTile(
                        leading: Icon(Icons.fingerprint),
                        title: Text('Biometria'),
                        subtitle: Text(
                            'Agrega tu huella digital como medio para autenticarte'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => setBiometricInformation(context, true),
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
                  subtitle: Text(
                      'Conoce los terminos y condiciones de la aplicación'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TermsScreen(),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text('Preguntas frecuentes'),
                  subtitle: Text(
                    'Conoce las respuestas a las preguntas más frecuentes acerca de la aplicación',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      // TODO: Goto faq screens
                      builder: (_) => FaqScreen(),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
