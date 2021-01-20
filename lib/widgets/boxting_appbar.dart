import 'package:flutter/material.dart';

class BoxtingAppBar extends AppBar {
  BoxtingAppBar({
    Key key,
    Widget leading,
    Widget title,
    Widget trailing,
    Color backgroundColor = Colors.white,
    double elevation = 0,
  }) : super(
          key: key,
          leading: leading,
          backgroundColor: backgroundColor,
          elevation: elevation,
          title: title,
          titleSpacing: 0,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          actions: [
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: trailing,
              )
          ],
        );
}