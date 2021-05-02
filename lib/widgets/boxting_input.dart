import 'package:flutter/material.dart';

enum BoxtingInputType {
  text,
  email,
  password,
  numeric,
}

class BoxtingInput extends StatelessWidget {
  final String labelText;
  final Widget suffix;
  final bool enabled;
  final TextEditingController controller;
  final String Function(String) validator;
  final int maxLines;
  final BoxtingInputType type;
  final VoidCallback onFocus;
  final double borderRadius;
  final bool readOnly;
  final bool autofocus;

  BoxtingInput({
    @required this.labelText,
    this.controller,
    this.suffix = const SizedBox(),
    this.type = BoxtingInputType.text,
    this.enabled = true,
    this.validator,
    this.maxLines = 1,
    this.onFocus,
    this.borderRadius = 5,
    this.readOnly = false,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onTap: onFocus,
      autofocus: autofocus ?? false,
      obscureText: type == BoxtingInputType.password,
      keyboardType: chooseTextInput(),
      controller: controller,
      enabled: enabled,
      enableInteractiveSelection: !readOnly,
      maxLines: maxLines,
      readOnly: readOnly,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        suffixIcon: suffix,
        labelText: labelText,
        focusColor: Theme.of(context).primaryColor,
        filled: true,
        labelStyle: TextStyle(
          color: enabled || readOnly ? Colors.grey[800] : Colors.grey[200],
        ),
        errorStyle: TextStyle(
          fontSize: 9,
        ),
        fillColor: enabled ? Colors.white : Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }

  TextInputType chooseTextInput() {
    switch (type) {
      case BoxtingInputType.numeric:
        return TextInputType.number;
        break;
      case BoxtingInputType.email:
        return TextInputType.emailAddress;
        break;
      default:
        return TextInputType.text;
    }
  }
}
