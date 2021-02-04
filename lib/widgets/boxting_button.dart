import 'package:flutter/material.dart';

class BoxtingButton extends StatelessWidget {
  const BoxtingButton({
    Key key,
    @required this.child,
    this.onPressed,
    this.backgroudColor,
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
  })  : assert(child != null),
        assert(height != null),
        assert(textStyle != null),
        assert(padding != null),
        super(key: key);

  const BoxtingButton.outline({
    double width,
    double height = 40,
    TextStyle textStyle = const TextStyle(
      color: Colors.pink,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    VoidCallback onPressed,
    @required Widget child,
  }) : this(
          width: width,
          height: height,
          textStyle: textStyle,
          backgroudColor: Colors.transparent,
          borderColor: Colors.pink,
          onPressed: onPressed,
          child: child,
        );

  final double height; // choose a default height
  final double width; // if null, use dense button
  final Widget child;
  final Color backgroudColor;
  final Color borderColor;
  final Color disabledBackgroudColor;
  final TextStyle textStyle;
  final VoidCallback onPressed; // if null, the button is disabled
  final EdgeInsets padding;
  final double borderRadius;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || disabled == true;
    final _backgroudColor = backgroudColor ?? Theme.of(context).primaryColor;
    return DefaultTextStyle(
      style: textStyle,
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: isDisabled ? null : onPressed,
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isDisabled ? disabledBackgroudColor : _backgroudColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: borderColor == null
                  ? null
                  : Border.all(width: 1.0, color: borderColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
