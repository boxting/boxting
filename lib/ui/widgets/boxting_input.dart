import 'package:flutter/material.dart';

class BoxtingInput extends StatelessWidget {
  final String label;
  final String helperText;
  final int fontSize;
  final Widget suffix;
  final bool enabled;
  final TextEditingController controller;
  final String Function(String) validator;
  final int maxLines;
  final TextInputType keyboardType;
  final VoidCallback onSelected;

  BoxtingInput({
    @required this.label,
    this.controller,
    this.suffix,
    this.keyboardType,
    this.enabled = true,
    this.helperText,
    this.fontSize = 12,
    this.validator,
    this.maxLines,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      onTap: onSelected,
      keyboardType: keyboardType ?? TextInputType.name,
      controller: controller,
      enabled: enabled,
      maxLines: this.maxLines == null ? 1 : this.maxLines,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        helperText: this.helperText,
        suffix: suffix ?? SizedBox(),
        labelText: this.label,
        focusColor: Theme.of(context).primaryColor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
