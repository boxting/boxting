import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_password_input.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends HookWidget {
  RegisterScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterBloc(authRepository: getIt.get<AuthRepository>()),
      builder: (_, __) => RegisterScreen._(),
    );
  }

  final _formKey = GlobalKey<FormState>();

  final EMAIL_REGEX =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  void register(BuildContext context) async {
    final bloc = context.read<RegisterBloc>();
    final registerResponse = await bloc.register();
    if (bloc.failure != null) {
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: 'Ocurrió un error!',
        text: bloc.failure.message,
      );
    } else {
      if (registerResponse) {
        await CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: 'Usuario registrado exitosamente!',
          text: 'Ya puedes iniciar sesión dentro de la aplicación',
          onConfirmBtnTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      } else {
        await CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Error al registrar usuario',
          text:
              'Ocurrió un error durante el registro del usuario. Intentelo de nuevo.',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RegisterBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Registrate dentro de Boxting!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Usuario',
                controller: bloc.usernameController,
                validator: (value) {
                  return value.length < 3 || value.length > 25
                      ? 'Ingrese un usuario de un tamaño valido'
                      : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingPasswordInput(
                controller: bloc.passwordController,
                validator: (value) {
                  return value.isEmpty || value.length < 6
                      ? 'Ingrese una contraseña de un tamaño válido'
                      : null;
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Correo',
                suffix: Icon(Icons.email),
                controller: bloc.mailController,
                type: BoxtingInputType.email,
                validator: (value) {
                  return RegExp(EMAIL_REGEX).hasMatch(value)
                      ? null
                      : 'Ingrese un correo válido';
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Telefono',
                suffix: Icon(Icons.phone),
                controller: bloc.phoneController,
                type: BoxtingInputType.numeric,
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
