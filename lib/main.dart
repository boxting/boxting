import 'package:boxting/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'boxting_theme.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(BoxtingApp());
}

class BoxtingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: boxtingTheme,
        home: SplashScreen(),
      ),
    );
  }
}
