import 'package:boxting/data/repository/settings_repository_impl.dart';
import 'package:boxting/ui/biometric/biometric_screen.dart';
import 'package:boxting/ui/settings/settings_bloc.dart';
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
          builder: (_) => BiometricScreen.init(context),
        ),
      );
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "Do you want to logout",
        confirmBtnText: "Yes",
        cancelBtnText: "No",
        onConfirmBtnTap: () => bloc.setBiometricInformation(enabled),
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
