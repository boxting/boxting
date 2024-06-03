import 'package:flutter/material.dart';

class BoxtingIcon extends StatelessWidget {
  final double width;
  final double height;

  const BoxtingIcon({super.key, this.width = 80, this.height = 80});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icons/boxting_icon_white.png',
      width: width,
      height: height,
    );
  }
}
