import 'package:flutter/material.dart';

class BoxtingIcon extends StatelessWidget {

  const BoxtingIcon({super.key, this.width = 80, this.height = 80});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icons/boxting_icon_white.png',
      width: width,
      height: height,
    );
  }
}
