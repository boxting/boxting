import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxtingSwitch extends StatelessWidget {
  const BoxtingSwitch({
    Key key,
    @required this.title,
    this.labelStyle,
    this.value,
    @required this.onChanged,
  })  : assert(onChanged != null),
        assert(title != null),
        super(key: key);

  final Widget title;
  final TextStyle labelStyle;
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
        Divider(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
