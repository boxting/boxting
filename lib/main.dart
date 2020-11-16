import 'package:boxting/ui/boxting_theme.dart';

import 'package:boxting/ui/splash/splash_bloc.dart';
import 'package:boxting/ui/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'ui/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(BoxtingApp());
}

class BoxtingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => SplashBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: boxtingTheme,
        home: SplashScreen.init(context),
      ),
    );
  }
}
