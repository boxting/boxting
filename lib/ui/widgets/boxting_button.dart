import 'package:flutter/material.dart';

enum BoxtingButtonType { primary, secondary, ternary, invalid }

class BoxtingButton extends StatelessWidget {
  final BoxtingButtonType type;
  final Widget child;
  final VoidCallback onPressed;

  const BoxtingButton({
    @required this.child,
    this.onPressed,
    this.type = BoxtingButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color btnColor;
    Border border;
    switch (this.type) {
      case BoxtingButtonType.primary:
        btnColor = Theme.of(context).primaryColor;
        break;
      case BoxtingButtonType.secondary:
        btnColor = Theme.of(context).canvasColor;
        border = Border.all(
          color: Theme.of(context).shadowColor,
          width: 1.0,
        );
        break;
      case BoxtingButtonType.ternary:
        btnColor = Theme.of(context).accentColor;
        break;
      case BoxtingButtonType.invalid:
        btnColor = Color(0XFFBFCFE2);
        break;
      default:
    }

    final dec = BoxDecoration(
      color: btnColor,
      borderRadius: BorderRadius.circular(8),
      border: border,
    );

    return InkWell(
      onTap: this.onPressed,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 50,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        alignment: Alignment.center,
        decoration: dec,
        child: this.child,
      ),
    );
  }
}
