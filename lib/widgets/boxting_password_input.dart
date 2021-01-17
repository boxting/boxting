import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BoxtingPasswordInput extends HookWidget {
  const BoxtingPasswordInput({
    Key key,
    @required this.controller,
    this.labelText = 'Contraseña',
    this.validator,
  })  : assert(controller != null),
        super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    final type = useState(BoxtingInputType.password);
    return BoxtingInput(
      controller: controller,
      labelText: labelText,
      validator: validator ??
          (value) => value.isEmpty ? 'Debe ingresar una contraseña' : null,
      type: type.value,
      suffix: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          type.value = type.value == BoxtingInputType.password
              ? BoxtingInputType.text
              : BoxtingInputType.password;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
          child: Text(
            type.value == BoxtingInputType.password ? 'Mostrar' : 'Ocultar',
            style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
