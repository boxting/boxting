import 'package:boxting/features/forgot_password/forgot_password_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ForgotPasswordCreateScreen extends HookWidget {
  const ForgotPasswordCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
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
                  'Crea una nueva contraseña',
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
                labelText: 'Contraseña nueva',
              ),
              const SizedBox(height: 24),
              BoxtingPasswordInput(
                controller: repeatPasswordController,
                labelText: 'Confirma tu contraseña nueva',
              ),
              const SizedBox(height: 28),
              BoxtingButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async => _createNewPassword(
                        context,
                        repeatPasswordController.text.trim(),
                      ),
                      onSuccess: () => BoxtingNavigation.gotoRoot(context),
                      onError: (err) async => BoxtingModal.show(
                        context,
                        title: 'Error',
                        message: 'No se pudo enviar restaurar contraseña.',
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

  Future<void> _createNewPassword(BuildContext context, String password) async {
    final bloc = context.read<ForgotPasswordBloc>();
    await bloc.createNewPassword(password);
  }

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ForgotPasswordBloc>(),
      builder: (_, __) => const ForgotPasswordCreateScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
      context,
      ForgotPasswordCreateScreen.init,
    );
  }
}
