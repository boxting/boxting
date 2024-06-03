import 'dart:io';

import 'package:boxting/widgets/boxting_icon.dart';
import 'package:flutter/material.dart';

class BoxtingAppBar extends AppBar {
  BoxtingAppBar({
    super.key,
    Widget? title,
    Widget? trailing,
    Color super.backgroundColor = Colors.white,
    double super.elevation = 0,
    bool isRoot = false,
  }) : super(
          title: Platform.isAndroid
              ? title ??
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isRoot) const SizedBox(width: 48),
                      const BoxtingIcon(width: 20, height: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Boxting',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
              : title ?? const BoxtingIcon(width: 40, height: 40),
          titleSpacing: 0,
          iconTheme: const IconThemeData(color: Colors.grey),
          actions: [trailing ?? const SizedBox.shrink()],
        );
}
