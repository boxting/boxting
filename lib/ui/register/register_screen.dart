import 'package:boxting/data/network/auth_api.dart';
import 'package:boxting/data/repository/register_repository_impl.dart';
import 'package:boxting/ui/register/register_bloc.dart';
import 'package:boxting/ui/widgets/boxting_button.dart';
import 'package:boxting/ui/widgets/boxting_input.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
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

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  void register(BuildContext context) async {
    final bloc = context.read<RegisterBloc>();
    final registerResponse = await bloc.register();
    if (bloc.failure != null) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Ocurrió un error!",
        text: bloc.failure.message,
      );
    } else {
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
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RegisterBloc>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Registrate dentro de Boxting!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'Nombre',
                controller: bloc.nameController,
                validator: (value) {
                  return value.isEmpty ? 'Debe ingresar información' : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'Apellido',
                controller: bloc.lastnameController,
                validator: (value) {
                  return value.isEmpty ? 'Debe ingresar información' : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'Usuario',
                controller: bloc.usernameController,
                validator: (value) {
                  return value.isEmpty ? 'Debe ingresar información' : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'Contraseña',
                isPasswordField: true,
                controller: bloc.passwordController,
                validator: (value) {
                  return value.isEmpty || value.length < 6
                      ? 'Ingrese una contraseña de un tamaño valido'
                      : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'DNI',
                suffix: Icon(Icons.perm_identity),
                controller: bloc.dniController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return value.length != 8 ? 'Error de longitud' : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'Correo',
                suffix: Icon(Icons.email),
                controller: bloc.mailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)
                      ? null
                      : 'Ingrese un correo válido';
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                label: 'Telefono',
                suffix: Icon(Icons.phone),
                controller: bloc.phoneController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return value.isEmpty ? 'Debe ingresar información' : null;
                },
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
                      onPressed: () => _formKey.currentState.validate()
                          ? register(context)
                          : null,
                    )
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
