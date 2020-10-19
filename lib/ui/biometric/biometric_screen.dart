import 'package:boxting/data/repository/settings_repository_impl.dart';
import 'package:boxting/ui/biometric/biometric_bloc.dart';
import 'package:boxting/ui/home/home_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class BiometricScreen extends StatefulWidget {
  BiometricScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BiometricBloc(repository: SettingsRepositoryImpl()),
      builder: (_, __) => BiometricScreen._(),
    );
  }

  @override
  _BiometricScreenState createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
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

  Future<void> _authenticate(BuildContext context) async {
    final bloc = context.read<BiometricBloc>();
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      if (authenticated) {
        bloc.setBiometricInformation(authenticated);
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "Perfecto",
          text: "Tu huella digital ha sido validada",
          confirmBtnText: 'Continuar',
          onConfirmBtnTap: () => goToHomeScreen(context, dialog: true),
        );
      } else {
        throw PlatformException(code: 'La autenticación fallo');
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/biometric_login.png',
                width: size.width,
                height: 360,
              ),
              Center(
                  child: Text(
                'Asegura tu voto utilizando tu huella digital!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              )),
              Text(
                'Ingresa a la aplicación utilizando tu huella digital y realizado todo de manera más rapida y segura. Recuerda que puedes modificar tu accesso con huella digital dentro de Configuración > Biometria',
              ),
              RaisedButton(
                child: Text(_isAuthenticating ? 'Cargando' : 'Autenticar'),
                onPressed: () async {
                  await _checkBiometrics();
                  await _getAvailableBiometrics();
                  if (_isAuthenticating)
                    _cancelAuthentication();
                  else
                    _authenticate(context);
                },
              ),
              InkWell(
                onTap: () => goToHomeScreen(context),
                child: Text('Omitir por ahora'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
