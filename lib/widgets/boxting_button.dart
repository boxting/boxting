import 'package:flutter/material.dart';

class BoxtingButton extends StatelessWidget {
  const BoxtingButton({
    required this.child,
    this.onPressed,
    this.backgroudColor = Colors.indigo,
    this.disabledBackgroudColor = Colors.grey,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 5,
    this.borderColor,
    this.disabled = false,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    super.key,
  });

  const BoxtingButton.outline({
    required Widget child, double width = 100,
    double height = 40,
    TextStyle textStyle = const TextStyle(
      color: Colors.pink,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    VoidCallback? onPressed,
    Key? key,
  }) : this(
          width: width,
          height: height,
          textStyle: textStyle,
          backgroudColor: Colors.transparent,
          borderColor: Colors.pink,
          onPressed: onPressed,
          child: child,
          key: key,
        );

  final double height; // choose a default height
  final double width; // if null, use dense button
  final Widget child;
  final Color backgroudColor;
  final Color? borderColor;
  final Color disabledBackgroudColor;
  final TextStyle textStyle;
  final VoidCallback? onPressed; // if null, the button is disabled
  final EdgeInsets padding;
  final double borderRadius;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled == true;

    return DefaultTextStyle(
      style: textStyle,
      child: Align(
        child: GestureDetector(
          onTap: isDisabled ? null : onPressed,
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isDisabled ? disabledBackgroudColor : backgroudColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: borderColor != null
                  ? Border.all(color: borderColor!)
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
