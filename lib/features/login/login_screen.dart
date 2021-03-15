import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/forgot_password/forgot_password_mail.dart';
import 'package:boxting/features/home/home_screen.dart';
import 'package:boxting/features/register/register_identifier_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_icon.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/boxting_password_input.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'login_bloc.dart';

class LoginScreen extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt.get<LoginBloc>()),
        ChangeNotifierProvider.value(value: getIt.get<BiometricBloc>())
      ],
      builder: (_, __) => LoginScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => LoginScreen.init(context));
  }

  @override
  Widget build(BuildContext context) {
    final _isAuthenticating = useState<bool>(false);
    final loginBloc = context.watch<LoginBloc>();
    final biometricBloc = context.watch<BiometricBloc>();

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    void showErrorAlert({String title, String text}) async =>
        await CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: title,
          text: text,
        );

    void login(BuildContext context) async {
      await loginBloc.login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
    }

    Future<void> authenticateBiometrical(BuildContext context) async {
      try {
        final bloc = context.read<LoginBloc>();
        final bioAuthEnabled = await bloc.loadBiometricInformation();
        await biometricBloc.checkBiometrics();
        await biometricBloc.getAvailableBiometrics();
        if (bioAuthEnabled) {
          if (_isAuthenticating.value) {
            biometricBloc.cancelAuthentication();
          } else {
            await biometricBloc.authenticate(
              onSuccess: () => HomeScreen.navigate(context),
              onFailure: (PlatformException e) => showErrorAlert(
                title: 'Algo malio sal',
                text: e.message,
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
        padding: const EdgeInsets.all(32.0),
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
                    value.isEmpty ? 'Debe ingresar un usuario' : null,
              ),
              SizedBox(height: 16),
              BoxtingPasswordInput(
                controller: passwordController,
                validator: (value) =>
                    value.isEmpty ? 'Debe ingresar una contraseña' : null,
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () => ForgotPasswordMailScreen.navigate(context),
                child: Text(
                  'Olvide mi contraseña',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              FlatButton.icon(
                onPressed: () async => await authenticateBiometrical(context),
                icon: Icon(Icons.fingerprint_outlined),
                label: Text('Autenticación biometrica'),
              ),
              const SizedBox(height: 48),
              BoxtingButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async => login(context),
                      onSuccess: () => HomeScreen.navigate(context),
                      onError: (e) async => await BoxtingModal.show(
                        context,
                        title: 'Ocurrio un error!',
                        message: e,
                      ),
                    );
                  }
                },
                child: Text(
                  'Ingresar'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: InkWell(
                  onTap: () => IdentifierRegisterScreen.navigate(context),
                  child: Text('Aún no tienes una cuenta? Registrate aquí'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
