import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfirmRegisterScreen extends StatelessWidget {
  const ConfirmRegisterScreen({super.key});

  static Widget init(BuildContext context) {
    return const ConfirmRegisterScreen();
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
      context,
      (_) => ConfirmRegisterScreen.init(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        BoxtingNavigation.gotoRoot(context);
      },
      child: BoxtingScaffold(
        appBar: BoxtingAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SuccessAnimation(),
              const SizedBox(height: 32),
              const Text(
                'Tú usuario fue creado con éxito',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 32),
              BoxtingButton(
                child: const Text('Volver a iniciar sesión'),
                onPressed: () async => BoxtingNavigation.gotoRoot(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
