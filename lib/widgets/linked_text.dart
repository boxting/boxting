import 'package:flutter/material.dart';

class LinkedText extends StatelessWidget {
  const LinkedText({
    Key key,
    this.prefix,
    @required this.link,
    @required this.onTap,
    this.linkColor,
  })  : assert(link != null),
        assert(onTap != null),
        super(key: key);

  final Widget prefix;
  final Widget link;
  final VoidCallback onTap;
  final Color linkColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null) ...[
          DefaultTextStyle(
            style: TextStyle(fontSize: 16, color: Colors.grey),
            child: prefix,
          ),
          SizedBox(width: 8),
        ],
        InkWell(
          onTap: onTap,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              color: linkColor ?? Colors.grey,
            ),
            child: link,
          ),
        ),
      ],
    );
  }
}
