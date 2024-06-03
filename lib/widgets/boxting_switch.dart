import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxtingSwitch extends StatelessWidget {
  const BoxtingSwitch({
    super.key,
    required this.title,
    this.value = false,
    required this.onChanged,
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
