import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/features/forgot_password/forgot_password_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends HookWidget {
  ForgotPasswordScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ForgotPasswordBloc(authRepository: getIt.get<AuthRepository>()),
      builder: (_, __) => ForgotPasswordScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: AppBar(
        title: Text('Recuperar contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Recuperar contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Ingresa tu correo electronico para poder enviarte un contraseña de respaldo.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            BoxtingInput(
              labelText: 'Correo electronico',
              type: BoxtingInputType.email,
            ),
            const SizedBox(height: 32),
            BoxtingButton(
              child: Text(
                'Continuar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
