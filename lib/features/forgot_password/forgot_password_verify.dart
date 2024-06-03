import 'package:boxting/features/forgot_password/forgot_password_create.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'forgot_password_bloc.dart';

class ForgotPasswordVerifyScreen extends HookWidget {
  const ForgotPasswordVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyCodeController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    final bloc = context.watch<ForgotPasswordBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
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
                  text: 'Ingresa el código de verificación que ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'recibiste en tu correo ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'para que puedas crear una nueva contraseña.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              BoxtingInput(
                controller: verifyCodeController,
                labelText: 'Código de verificación',
                validator: (value) =>
                    value!.isEmpty ? 'Este campo no puede estar vacio' : null,
              ),
              const SizedBox(height: 28),
              BoxtingButton(
                width: double.infinity,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async => bloc.verifyCode(
                        verifyCodeController.text.trim(),
                      ),
                      onSuccess: () =>
                          ForgotPasswordCreateScreen.navigate(context),
                      onError: (e) async => BoxtingModal.show(
                        context,
                        title: 'Error!',
                        message: e,
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

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ForgotPasswordBloc>(),
      builder: (_, __) => const ForgotPasswordVerifyScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (_) => ForgotPasswordVerifyScreen.init(context));
  }
}
