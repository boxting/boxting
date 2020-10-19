import 'package:boxting/ui/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloc(),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
