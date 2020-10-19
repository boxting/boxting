import 'package:boxting/data/network/login_api.dart';
import 'package:boxting/data/repository/login_repository_impl.dart';
import 'package:boxting/data/repository/settings_repository_impl.dart';
import 'package:boxting/ui/biometric/biometric_screen.dart';
import 'package:boxting/ui/home/home_screen.dart';
import 'package:boxting/ui/login/login_bloc.dart';
import 'package:boxting/ui/register/register_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBloc(
        loginRepository: LoginRepositoryImpl(loginApi: LoginApi()),
        settingsRepository: SettingsRepositoryImpl(),
      ),
      builder: (_, __) => LoginScreen._(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  bool _canCheckBiometrics;

  List<BiometricType> _availableBiometrics;

  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  void goToHomeScreen(BuildContext context, {bool dialog = false}) {
    // Pop the dialog
    if (dialog) Navigator.pop(context);
    // Go to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen.init(context),
      ),
    );
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      if (authenticated) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "Perfecto",
          text: "Tu huella digital ha sido validada",
          confirmBtnText: 'Continuar',
          onConfirmBtnTap: () => goToHomeScreen(context, dialog: true),
        );
      } else {
        throw PlatformException(code: 'Autenticación fallida');
      }
    } on PlatformException catch (e) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Algo malio sal",
        text: e.message,
      );
    }
    if (!mounted) return;
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  void login(BuildContext context) async {
    final bloc = context.read<LoginBloc>();
    final loginResult = await bloc.login();
    final fingerprintLogin = await bloc.loadBiometricInformation();
    if (loginResult) {
      if (fingerprintLogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen.init(context)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BiometricScreen.init(context)),
        );
      }
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Algo salio mal",
        text: "Error al iniciar sesión. Usuario o contraseña incorrectos.",
      );
    }
  }

  void goToRegister(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RegisterScreen.init(context),
        ),
      );

  void authenticateBiometrical(BuildContext context) async {
    final bloc = context.read<LoginBloc>();
    final biometricLoginEnabled = await bloc.loadBiometricInformation();

    if (biometricLoginEnabled) {
      await _checkBiometrics();
      await _getAvailableBiometrics();
      if (_isAuthenticating)
        _cancelAuthentication();
      else
        _authenticate();
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Ocurrió un error",
        text: "Aún no has validado tu huella digital en este dispositivo.",
        confirmBtnText: 'Ok',
        onConfirmBtnTap: () => Navigator.pop(context),
      );
    }
  }

  var rememberCheckbox = false;

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/boxting_icon_white.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 32),
            TextField(
              controller: loginBloc.usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Usuario',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: loginBloc.passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Contraseña',
              ),
            ),
            SizedBox(height: 8),
            CheckboxListTile(
              title: Text('Recordar'),
              value: rememberCheckbox,
              onChanged: (bool value) {
                setState(() => rememberCheckbox = value);
              },
            ),
            FlatButton.icon(
              onPressed: () => authenticateBiometrical(context),
              icon: Icon(Icons.fingerprint_outlined),
              label: Text('Autenticación biometrica'),
            ),
            SizedBox(height: 32),
            loginBloc.loginState == LoginState.loading
                ? Center(child: CircularProgressIndicator())
                : FlatButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () => login(context),
                    child: Text('Ingresar'.toUpperCase()),
                  ),
            SizedBox(height: 8),
            InkWell(
              onTap: () => goToRegister(context),
              child: Text(
                'Aún no tienes una cuenta? Registrate aquí',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
