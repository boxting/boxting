import 'package:boxting/features/forgot_password/view/forgot_password_mail.dart';
import 'package:boxting/features/home/home_screen.dart';
import 'package:boxting/features/login/provider/provider.dart';
import 'package:boxting/features/register/view/register_identifier_screen.dart';
import 'package:boxting/widgets/boxting_icon.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quickalert/quickalert.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});

  static const route = '/login';
  static const name = 'login_screen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showErrorAlert({
      required String title,
      String text = '',
    }) =>
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: text,
        );

    // ref.listen(biometricNotifierProvider, (_, state) {
    //   if (state is BiometricAuthenticated) {
    //     BoxtingLoadingDialog.show(
    //       context,
    //       futureBuilder: () async => ref.watch(refreshTokenProvider),
    //       onSuccess: () => HomeScreen.navigate(context),
    //       onError: (e) async => BoxtingModal.show(
    //         context,
    //         title: 'Ocurrio un error!',
    //       ),
    //     );
    //   }

    //   if (state is BiometricError) {
    //     showErrorAlert(
    //       title: 'Algo malio sal',
    //       text: 'Er',
    //     );
    //   }
    // });

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    Future<void> authenticateBiometrical() async {
      try {
        // final bioAuthEnabled = notifier;
        // await notifier.checkBiometrics();
        // await notifier.getAvailableBiometrics();
        // if (bioAuthEnabled) {
        //   if (isAuthenticating.value) {
        //     notifier.cancelAuthentication();
        //   } else {
        //     await notifier.authenticate();
        //   }
        // } else {
        //   showErrorAlert(
        //     title: 'Algo malio sal',
        //     text: 'Aún no has configurado tu autenticación por huella digital',
        //   );
        // }
      } catch (e) {
        showErrorAlert(
          title: 'Algo malio sal',
          text: 'Aún no has validado tu huella digital en este dispositivo.',
        );
      }
    }

    return HookConsumer(
      builder: (context, ref, child) {
        return BoxtingScaffold(
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  const BoxtingIcon(),
                  const SizedBox(height: 32),
                  BoxtingInput(
                    labelText: 'Usuario',
                    controller: usernameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Debe ingresar un usuario' : null,
                  ),
                  const SizedBox(height: 16),
                  BoxtingPasswordInput(
                    controller: passwordController,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => ForgotPasswordMailScreen.navigate(context),
                    child: const Text(
                      'Olvide mi contraseña',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    label: Text('Autenticacion biometrica'),
                    onPressed: authenticateBiometrical,
                    icon: const Icon(Icons.fingerprint_outlined),
                  ),
                  const SizedBox(height: 48),
                  BoxtingButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();
                        final res = ref.watch(
                          loginProvider(username, password),
                        );
                        res.when(
                          data: (data) => HomeScreen.navigate(context),
                          error: (e, st) =>
                              BoxtingModal.show(context, title: 'Error'),
                          loading: () => BoxtingLoadingDialog.show(context),
                        );
                      }
                    },
                    child: Text(
                      'Ingresar'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: InkWell(
                      onTap: () => IdentifierRegisterScreen.navigate(context),
                      child: const Text(
                        'Aún no tienes una cuenta? Registrate aquí',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
