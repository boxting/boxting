import 'package:flutter/material.dart';

enum BoxtingInputType {
  text,
  email,
  password,
  numeric,
}

class BoxtingInput extends StatelessWidget {
  const BoxtingInput({
    required this.labelText,
    super.key,
    this.controller,
    this.suffix = const SizedBox(),
    this.type = BoxtingInputType.text,
    this.enabled = true,
    this.validator,
    this.maxLines = 1,
    this.onFocus,
    this.borderRadius = 5,
    this.readOnly = false,
    this.autofocus = false,
  });
  final String labelText;
  final Widget suffix;
  final bool enabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final BoxtingInputType type;
  final VoidCallback? onFocus;
  final double borderRadius;
  final bool readOnly;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onTap: onFocus,
      autofocus: autofocus,
      obscureText: type == BoxtingInputType.password,
      keyboardType: chooseTextInput(),
      controller: controller ?? TextEditingController(),
      enabled: enabled,
      enableInteractiveSelection: !readOnly,
      maxLines: maxLines,
      readOnly: readOnly,
      style: const TextStyle(
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
        errorStyle: const TextStyle(
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
    if (type == BoxtingInputType.numeric) {
      return TextInputType.number;
    } else if (type == BoxtingInputType.email) {
      return TextInputType.emailAddress;
    } else {
      return TextInputType.text;
    }
  }
}
