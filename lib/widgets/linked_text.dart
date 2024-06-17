import 'package:flutter/material.dart';

class LinkedText extends StatelessWidget {
  const LinkedText({
    required this.link, required this.onTap, super.key,
    this.prefix = const SizedBox.shrink(),
    this.linkColor = Colors.grey,
  });

  final Widget prefix;
  final Widget link;
  final VoidCallback onTap;
  final Color linkColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...[
          DefaultTextStyle(
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            child: prefix,
          ),
        ],
        InkWell(
          onTap: onTap,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              color: linkColor,
            ),
            child: link,
          ),
        ),
      ],
    );
  }
}
