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
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: title ??
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BoxtingIcon(width: 20, height: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Boxting',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ))
              : title ?? BoxtingIcon(width: 40, height: 40),
          titleSpacing: 0,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [trailing ?? Container()],
        );
}
