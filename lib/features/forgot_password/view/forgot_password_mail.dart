import 'package:boxting/features/forgot_password/provider/provider.dart';
import 'package:boxting/features/forgot_password/view/forgot_password_verify.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordMailScreen extends HookConsumerWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final mailController = useTextEditingController();

    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Recupera tu contraseña',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            RichText(
              text: const TextSpan(
                text: 'Ingresa tu correo y te enviaremos ',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'un código de verificación ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'para que puedas cambiar tu contraseña.',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            BoxtingInput(
              labelText: 'Correo electrónico',
              controller: mailController,
              type: BoxtingInputType.email,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Debe ingresar un correo';
                }
                if (!RegExp(emailRegex).hasMatch(value)) {
                  return 'Ingrese un correo válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),
            BoxtingButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await BoxtingLoadingDialog.show(
                    context,
                    futureBuilder: () async {
                      final email = mailController.text.trim();
                      ref.read(forgotPasswordProvider(email));
                    },
                    onSuccess: () =>
                        ForgotPasswordVerifyScreen.navigate(context),
                    onError: (e) async => BoxtingModal.show(
                      context,
                      title: 'Error',
                      message: 'No se pudo ',
                    ),
                  );
                }
              },
              child: const Text('Recibir código'),
            ),
          ],
        ),
      ),
    );
  }

  static Widget init(BuildContext context) {
    return const ForgotPasswordMailScreen();
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
      context,
      ForgotPasswordMailScreen.init,
    );
  }
}
