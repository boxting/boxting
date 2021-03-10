import 'dart:io';

import 'package:boxting/widgets/boxting_icon.dart';
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
          title: Platform.isAndroid
              ? Center(child: title ?? BoxtingIcon(width: 40, height: 40))
              : title ?? BoxtingIcon(width: 40, height: 40),
          titleSpacing: 0,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [trailing ?? Container()],
        );
}
