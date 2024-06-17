import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/features/register/view/register_password_screen.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends HookConsumerWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const route = 'register';
  static const name = 'register_screen';

  Future<void> registerPersonalInfo(
    BuildContext context,
    String mail,
    String phone,
    String username,
  ) async {
    final bloc = context.read<RegisterBloc>();
    await bloc.registerPersonalInformation(mail, phone, username);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final mailController = useTextEditingController();
    final phoneController = useTextEditingController();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Registrate dentro de Boxting!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ingresa tus datos para continuar',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Usuario',
                controller: usernameController,
                validator: (value) {
                  return value!.length < 3 || value.length > 25
                      ? 'Ingrese un usuario de un tamaño valido'
                      : null;
                },
              ),
              const SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Correo',
                suffix: const Icon(Icons.email),
                controller: mailController,
                type: BoxtingInputType.email,
                validator: (value) {
                  return RegExp(emailRegex).hasMatch(value!)
                      ? null
                      : 'Ingrese un correo válido';
                },
              ),
              const SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Telefono',
                suffix: const Icon(Icons.phone),
                controller: phoneController,
                type: BoxtingInputType.numeric,
                validator: (value) {
                  return value!.isEmpty ? 'Debe ingresar información' : null;
                },
              ),
              const SizedBox(height: 16),
              BoxtingButton(
                child: Text(
                  'Registrar'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await BoxtingLoadingDialog.show(
                      context,
                      futureBuilder: () async => registerPersonalInfo(
                        context,
                        mailController.text.trim(),
                        phoneController.text.trim(),
                        usernameController.text.trim(),
                      ),
                      onSuccess: () => RegisterPasswordScreen.navigate(context),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
