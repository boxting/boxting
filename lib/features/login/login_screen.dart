import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/forgot_password/forgot_password_mail.dart';
import 'package:boxting/features/home/home_screen.dart';
import 'package:boxting/features/login/login_bloc.dart';
import 'package:boxting/features/login/provider/login_provider.dart';
import 'package:boxting/features/register/register_identifier_screen.dart';
import 'package:boxting/widgets/boxting_icon.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});

  static const route = '/login';
  static const name = 'login_screen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    final loginBloc = context.watch<LoginBloc>();
    final biometricBloc = context.watch<BiometricBloc>();

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    void showErrorAlert({
      required String title,
      String text = '',
    }) =>
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: text,
        );

    Future<void> refreshToken(BuildContext context) async {
      await loginBloc.refreshToken();
    }

    Future<void> authenticateBiometrical(BuildContext context) async {
      try {
        final bloc = context.read<LoginBloc>();
        final bioAuthEnabled = await bloc.loadBiometricInformation();
        await biometricBloc.checkBiometrics();
        await biometricBloc.getAvailableBiometrics();
        if (bioAuthEnabled) {
          if (isAuthenticating.value) {
            biometricBloc.cancelAuthentication();
          } else {
            await biometricBloc.authenticate(
              onSuccess: () async => BoxtingLoadingDialog.show(
                context,
                futureBuilder: () async => refreshToken(context),
                onSuccess: () => HomeScreen.navigate(context),
                onError: (e) async => BoxtingModal.show(
                  context,
                  title: 'Ocurrio un error!',
                ),
              ),
              onFailure: (PlatformException e) => showErrorAlert(
                title: 'Algo malio sal',
                text: e.message!,
              ),
            );
          }
        } else {
          showErrorAlert(
            title: 'Algo malio sal',
            text: 'Aún no has configurado tu autenticación por huella digital',
          );
        }
      } catch (e) {
        showErrorAlert(
          title: 'Algo malio sal',
          text: 'Aún no has validado tu huella digital en este dispositivo.',
        );
      }
    }

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
              IconButton(
                onPressed: () => authenticateBiometrical(context),
                icon: const Icon(Icons.fingerprint_outlined),
              ),
              const SizedBox(height: 48),
              BoxtingButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();
                        ref.read(loginProvider.notifier).login(
                              username,
                              password,
                            );
                      },
                      onSuccess: () => HomeScreen.navigate(context),
                      // todo: replace with listen
                      onError: (e) async => BoxtingModal.show(
                        context,
                        title: 'Ocurrio un error!',
                      ),
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
                  child:
                      const Text('Aún no tienes una cuenta? Registrate aquí'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
