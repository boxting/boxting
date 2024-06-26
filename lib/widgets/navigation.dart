import 'package:flutter/material.dart';

class BoxtingNavigation {
  static Future<T?> goto<T>(BuildContext context, WidgetBuilder builer) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: builer),
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    return Navigator.pop(context, result);
  }

  static Future<void> replace<T>(BuildContext context, WidgetBuilder builder) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: builder),
    );
  }

  static void gotoRoot(BuildContext context) {
    return Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
