import 'package:boxting/boxting_theme.dart';
import 'package:boxting/firebase_options.dart';
import 'package:boxting/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  runApp(ProviderScope(child: BoxtingApp()));
}

class BoxtingApp extends StatelessWidget {
  const BoxtingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: BoxtingRouter.router,
      theme: boxtingTheme,
    );
  }
}
