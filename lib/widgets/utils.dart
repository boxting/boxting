import 'package:flutter/material.dart';

typedef ValueConverter<T, C> = C Function(T);
typedef AsyncValueConverter<T, C> = Future<C> Function(T);

typedef ControllerBuilder<T extends ChangeNotifier> = Widget Function(
  BuildContext context,
  T controller,
);
