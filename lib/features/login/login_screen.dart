import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/biometric/biometric_screen.dart';
import 'package:boxting/features/forgot_password/forgot_password_screen.dart';
import 'package:boxting/features/home/home_screen.dart';
import 'package:boxting/features/register/identifier_register_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_icon.dart';
import 'package:boxting/widgets/boxting_password_input.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'login_bloc.dart';

class LoginScreen extends HookWidget {
  LoginScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginBloc>(
          create: (_) => LoginBloc(
            authRepository: getIt.get<AuthRepository>(),
            biometricRepository: getIt.get<BiometricRepository>(),
          ),
        ),
        ChangeNotifierProvider<BiometricBloc>(
          create: (_) => BiometricBloc(
            getIt.get<BiometricRepository>(),
            getIt.get<LocalAuthentication>(),
          ),
        )
      ],
      builder: (_, __) => LoginScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _isAuthenticating = useState<bool>(false);

    final loginBloc = context.watch<LoginBloc>();
    final biometricBloc = context.watch<BiometricBloc>();

    void login(BuildContext context) async {
      if (loginBloc.usernameController.text.trim().isEmpty ||
          loginBloc.passwordController.text.trim().isEmpty) {
        await BoxtingModal.show(
          context,
          title: 'Ocurrio un error!',
          message: 'Debe llenar los campos obligatiorios',
        );
        return;
      }

      final isFirstTimeLogin = await loginBloc.isFirstTimeLogin();
      final fingerprintLogin = await loginBloc.loadBiometricInformation();
      final loginResult = await loginBloc.login();

      if (loginBloc.failure != null) {
        await CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Ocurrio un error!',
          text: loginBloc.failure.message,
        );
      } else {
        if (loginResult) {
          if (fingerprintLogin) {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen.init(context)),
            );
          } else {
            if (isFirstTimeLogin) {
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        BiometricScreen.init(context, settings: false)),
              );
            } else {
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen.init(context)),
              );
            }
          }
        } else {
          await CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: 'Algo salio mal',
            text: 'Error al iniciar sesión. Usuario o contraseña incorrectos.',
          );
        }
      }
    }

    void goToRegister(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => IdentifierRegisterScreen.init(context),
        ));

    void authenticateBiometrical(BuildContext context) async {
      final bloc = context.read<LoginBloc>();
      final biometricLoginEnabled = await bloc.loadBiometricInformation();

      if (biometricLoginEnabled) {
        await biometricBloc.checkBiometrics();
        await biometricBloc.getAvailableBiometrics();
        if (_isAuthenticating.value) {
          biometricBloc.cancelAuthentication();
        } else {
          await biometricBloc.authenticate(
            context: context,
            onSuccess: () => CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: 'Perfecto',
                text: 'Tu huella digital ha sido validada',
                confirmBtnText: 'Continuar',
                barrierDismissible: false,
                onConfirmBtnTap: () =>
                    biometricBloc.goToHomeScreen(context, dialog: true)),
            onFailure: (PlatformException e) => CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: 'Algo malio sal',
              text: e.message,
            ),
          );
        }
      } else {
        await CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Ocurrió un error',
          text: 'Aún no has validado tu huella digital en este dispositivo.',
          confirmBtnText: 'Ok',
          onConfirmBtnTap: () => Navigator.pop(context),
        );
      }
    }

    return BoxtingScaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: <Widget>[
            BoxtingIcon(),
            const SizedBox(height: 32),
            BoxtingInput(
              labelText: 'Usuario',
              controller: loginBloc.usernameController,
            ),
            SizedBox(height: 16),
            BoxtingPasswordInput(
              controller: loginBloc.passwordController,
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () => goToForgotPassword(context),
              child: Text(
                'Olvide mi contraseña',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 8),
            FlatButton.icon(
              onPressed: () => authenticateBiometrical(context),
              icon: Icon(Icons.fingerprint_outlined),
              label: Text('Autenticación biometrica'),
            ),
            SizedBox(height: 48),
            loginBloc.loginState == LoginState.loading
                ? Center(child: CircularProgressIndicator())
                : BoxtingButton(
                    onPressed: () => login(context),
                    child: Text(
                      'Ingresar'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            SizedBox(height: 32),
            Center(
              child: InkWell(
                onTap: () => goToRegister(context),
                child: Text('Aún no tienes una cuenta? Registrate aquí'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToForgotPassword(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen.init(context),
        ),
      );
}
