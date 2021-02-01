import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/features/forgot_password/forgot_password_verify.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'forgot_password_bloc.dart';

class ForgotPasswordMailScreen extends HookWidget {
  const ForgotPasswordMailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final mailController = useTextEditingController();

    final EMAIL_REGEX =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
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
              text: TextSpan(
                text: 'Ingresa tu correo y te enviaremos ',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'un código de verificación ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: 'para que puedas cambiar tu contraseña.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            BoxtingInput(
              labelText: 'Correo electronico',
              controller: mailController,
              type: BoxtingInputType.email,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Debe ingresar un documento';
                }
                if (!RegExp(EMAIL_REGEX).hasMatch(value)) {
                  return 'Ingrese un correo válido';
                }
                return null;
              },
            ),
            SizedBox(height: 28),
            BoxtingButton(
              child: Text('Recibir código'),
              width: double.infinity,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await BoxtingLoadingDialog.show(
                    context,
                    futureBuilder: () async => sendVerificationCode(
                      context,
                      mailController.text.trim(),
                    ),
                    onSuccess: () =>
                        ForgotPasswordVerifyScreen.navigate(context),
                    onError: (e) async => showErrorModal(context),
                  );

                  //     final provider =
                  //         context.read<ForgotPwRepo>(forgotPwProvider);
                  //     await provider.recoverPassword(documentController.text);
                  //   },
                  //   onSuccess: () =>
                  //       ForgotPasswordVerifyScreen.navigate(context),
                  //   onError: (err) async {
                  //   },
                  // );
                }
              },
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  void showErrorModal(BuildContext context) async => await BoxtingModal.show(
        context,
        title: 'El correo no está registrado',
        message: 'No existe usuario con el correo indicado',
      );

  void sendVerificationCode(BuildContext context, String mail) async {
    final bloc = context.read<ForgotPasswordBloc>();
    await bloc.forgotPassword(mail);
  }

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ForgotPasswordBloc(authRepository: getIt.get<AuthRepository>()),
      builder: (_, __) => ForgotPasswordMailScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (context) => ForgotPasswordMailScreen.init(context));
  }
}
