import 'package:boxting/widgets/utils.dart';
import 'package:flutter/material.dart';

class BoxtingSelect<T> extends StatelessWidget {
  const BoxtingSelect({
    required this.label, required this.formatter, super.key,
    this.items = const [],
    this.onChanged,
    this.defaultValue,
    this.helperText = '',
    this.borderRadius = 5,
    this.validator,
    this.onTap,
    this.enabled = true,
    this.disabledHint = const SizedBox.shrink(),
  });

  final String label;
  final String helperText;
  final double borderRadius;
  final T? defaultValue;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final ValueConverter<T, String> formatter;
  final bool enabled;
  final VoidCallback? onTap;
  final String? Function(T?)? validator;
  final Widget disabledHint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validator,
      value: defaultValue,
      disabledHint: disabledHint,
      decoration: InputDecoration(
        helperText: helperText,
        labelText: label,
        errorStyle: const TextStyle(fontSize: 9),
        focusColor: Theme.of(context).primaryColor,
        filled: true,
        labelStyle: TextStyle(
          fontSize: 14,
          color: enabled ? Colors.grey : Colors.grey,
        ),
        hintStyle: TextStyle(
          color: enabled ? Colors.green : Colors.grey,
          fontSize: 14,
        ),
        helperStyle: const TextStyle(fontSize: 14),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      items: items.isNotEmpty
          ? [
              for (final val in items)
                DropdownMenuItem<T>(
                  value: val,
                  child: Text(
                    formatter(val),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ]
          : null,
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
