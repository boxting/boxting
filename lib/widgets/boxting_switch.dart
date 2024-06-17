import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxtingSwitch extends StatelessWidget {
  const BoxtingSwitch({
    required this.title, required this.onChanged, super.key,
    this.value = false,
  });

  final Widget title;
  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: title),
            CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
