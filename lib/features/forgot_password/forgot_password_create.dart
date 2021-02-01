import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/features/forgot_password/forgot_password_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ForgotPasswordCreateScreen extends HookWidget {
  const ForgotPasswordCreateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  'Crea una nueva contraseña',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 9),
              BoxtingInput(
                controller: passwordController,
                labelText: 'Contraseña nueva',
                validator: (value) =>
                    value.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              SizedBox(height: 24),
              BoxtingInput(
                controller: repeatPasswordController,
                labelText: 'Confirma tu contraseña nueva',
                validator: (value) => value.isEmpty ||
                        repeatPasswordController.text.trim() !=
                            passwordController.text.trim()
                    ? 'Este campo no es el mismo que tu contraseña'
                    : null,
              ),
              SizedBox(height: 28),
              BoxtingButton(
                child: Text('Verificar'),
                width: double.infinity,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // LoadingDialog.show(
                    //   context,
                    //   futureBuilder: () => provider.verifyPwReset(
                    //     passwordController.text.trim(),
                    //     repeatPasswordController.text.trim(),
                    //   ),
                    //   onSuccess: () => ForgotPasswordSuccess.navigate(context),
                    //   onError: (err) => VModal.show(
                    //     context,
                    //     title: 'Error reiniciando password',
                    //     message: 'Hubo un error al reiniciar el password.',
                    //     buttonText: 'Intentar de nuevo',
                    //   ),
                    // );
                  }
                },
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ForgotPasswordBloc(authRepository: getIt.get<AuthRepository>()),
      builder: (_, __) => ForgotPasswordCreateScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (context) => ForgotPasswordCreateScreen.init(context));
  }
}
