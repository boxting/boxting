import 'package:boxting/data/network/auth_api.dart';
import 'package:boxting/data/repository/register_repository_impl.dart';
import 'package:boxting/ui/register/register_bloc.dart';
import 'package:boxting/ui/widgets/boxting_button.dart';
import 'package:boxting/ui/widgets/boxting_input.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterBloc(
        registerRepository: RegisterRepositoryImpl(
          authenticationApi: AuthenticationApi(),
        ),
      ),
      builder: (_, __) => RegisterScreen._(),
    );
  }

  void register(BuildContext context) async {
    final bloc = context.read<RegisterBloc>();
    final registerResponse = await bloc.register();
    if (registerResponse) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Usuario registrado exitosamente!",
        text: "Ya puedes iniciar sesión dentro de la aplicación",
        onConfirmBtnTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error al registrar usuario",
        text:
            "Ocurrió un error durante el registro del usuario. Intentelo de nuevo.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RegisterBloc>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Text(
              'Registrate dentro de Boxting!',
              style: TextStyle(),
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'Nombre',
              controller: bloc.nameController,
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'Apellido',
              controller: bloc.lastnameController,
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'Usuario',
              controller: bloc.usernameController,
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'Contraseña',
              controller: bloc.passwordController,
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'DNI',
              suffix: Icon(Icons.perm_identity),
              controller: bloc.dniController,
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'Correo',
              suffix: Icon(Icons.email),
              controller: bloc.mailController,
            ),
            SizedBox(height: 16),
            BoxtingInput(
              label: 'Telefono',
              suffix: Icon(Icons.phone),
              controller: bloc.phoneController,
            ),
            SizedBox(height: 16),
            bloc.registerState == RegisterState.initial
                ? BoxtingButton(
                    child: Text(
                      'Registrar'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    type: BoxtingButtonType.primary,
                    onPressed: () => register(context),
                  )
                : Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
