import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/features/register/view/register_confirm_screen.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

class RegisterPasswordScreen extends HookConsumerWidget {
  const RegisterPasswordScreen({super.key});

  static Widget init(BuildContext context) {
    return const RegisterPasswordScreen();
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
      context,
      (_) => RegisterPasswordScreen.init(context),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    final bloc = context.watch<RegisterBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
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
              const SizedBox(height: 9),
              BoxtingPasswordInput(
                controller: passwordController,
              ),
              const SizedBox(height: 24),
              BoxtingPasswordInput(
                controller: repeatPasswordController,
                labelText: 'Confirma tu contraseña',
              ),
              const SizedBox(height: 28),
              BoxtingButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async =>
                          bloc.registerPassword(passwordController.text.trim()),
                      onSuccess: () => ConfirmRegisterScreen.navigate(context),
                      onError: (err) async => BoxtingModal.show(
                        context,
                        title: 'Error',
                        message: 'No se pudo registrar la contrsena.',
                      ),
                    );
                  }
                },
                child: const Text('Verificar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
