import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmRegisterScreen extends StatelessWidget {
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<RegisterBloc>(),
      builder: (_, __) => ConfirmRegisterScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (_) => ConfirmRegisterScreen.init(context));
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
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
              child: Text('Volver a iniciar sesión'),
              onPressed: () async => BoxtingNavigation.gotoRoot(context),
            )
          ],
        ),
      ),
    );
  }
}
