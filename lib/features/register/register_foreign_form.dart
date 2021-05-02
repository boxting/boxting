import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/features/register/register_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class RegisterForeignForm extends HookWidget {
  final String document;

  static Widget init(BuildContext context, String document) {
    return ChangeNotifierProvider.value(
      value: getIt.get<RegisterBloc>(),
      builder: (_, __) => RegisterForeignForm(document: document),
    );
  }

  static Future<void> navigate(BuildContext context, String document) async {
    await BoxtingNavigation.goto(
        context, (_) => RegisterForeignForm.init(context, document));
  }

  const RegisterForeignForm({Key key, this.document}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final firstLastnameController = useTextEditingController();
    final secondLastnameController = useTextEditingController();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Registra tus datos personales aquí',
                style: subTitleTextStyle,
              ),
              SizedBox(height: 48),
              BoxtingInput(
                labelText: 'Nombres',
                controller: nameController,
                validator: (value) {
                  return value.isNotEmpty ? null : 'Debe ingresar un nombre';
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Apellido paterno',
                controller: firstLastnameController,
                validator: (value) {
                  return value.isNotEmpty ? null : 'Debe ingresar un apellido';
                },
              ),
              SizedBox(height: 16),
              BoxtingInput(
                labelText: 'Apellido materno',
                controller: secondLastnameController,
                validator: (value) {
                  return value.isNotEmpty ? null : 'Debe ingresar un apellido';
                },
              ),
              SizedBox(height: 16),
              BoxtingButton(
                child: Text('Guardar'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final bloc = context.read<RegisterBloc>();
                    final data = DniResponseData(
                      names: nameController.text.trim(),
                      fatherLastname: firstLastnameController.text.trim(),
                      motherLastname: secondLastnameController.text.trim(),
                      dni: document.trim(),
                      cui: 0,
                      used: false,
                    );
                    bloc.registerIdentifierInformation(data);
                    RegisterScreen.navigate(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
