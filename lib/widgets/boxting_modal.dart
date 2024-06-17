import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BoxtingModal extends StatelessWidget {
  const BoxtingModal({
    required this.title, required this.body, super.key,
    this.height = 0,
    this.width = 0,
    this.style = const TextStyle(color: Colors.white, fontSize: 14),
    this.buttonTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    this.buttonBackgroundColor = Colors.white,
    this.buttonContent = '',
    this.onButtonPressed,
    this.color = Colors.red,
  });

  final String title;
  final double height;
  final double width;
  final String body;
  final TextStyle style;
  final Color buttonBackgroundColor;
  final TextStyle buttonTextStyle;
  final String buttonContent;
  final VoidCallback? onButtonPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: color,
        height: height,
        width: width,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(body),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BoxtingButton(
                    backgroudColor: Colors.white,
                    onPressed: onButtonPressed,
                    child: Text(
                      buttonContent,
                      style: const TextStyle(fontSize: 12, color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> show(
    BuildContext context, {
    String title = '',
    String message = '',
    String buttonText = '',
    VoidCallback? onButtonPressed,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) => Align(
        alignment: Alignment.topCenter,
        child: BoxtingModal(
          width: double.infinity,
          buttonBackgroundColor: Colors.red,
          title: title,
          body: message,
          buttonContent: buttonText,
          onButtonPressed: () {
            onButtonPressed?.call();
            BoxtingNavigation.pop(dialogContext);
          },
        ),
      ),
    );
  }
}
