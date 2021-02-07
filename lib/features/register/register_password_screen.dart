import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/features/register/register_confirm_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class RegisterPasswordScreen extends HookWidget {
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<RegisterBloc>(),
      builder: (_, __) => RegisterPasswordScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (_) => RegisterPasswordScreen.init(context));
  }

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();
    final bloc = context.watch<RegisterBloc>();
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
                  'Crea una contraseña',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 9),
              BoxtingPasswordInput(
                controller: passwordController,
                labelText: 'Contraseña',
                validator: (value) =>
                    value.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              SizedBox(height: 24),
              BoxtingPasswordInput(
                controller: repeatPasswordController,
                labelText: 'Confirma tu contraseña',
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
                    BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async =>
                          bloc.registerPassword(passwordController.text.trim()),
                      onSuccess: () => ConfirmRegisterScreen.navigate(context),
                      onError: (err) async => await BoxtingModal.show(
                        context,
                        title: 'Error',
                        message: err,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
