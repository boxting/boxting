import 'package:boxting/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'boxting_theme.dart';
import 'domain/constants/constants.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(const BoxtingApp());
}

class BoxtingApp extends StatelessWidget {
  const BoxtingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: boxtingTheme,
        home: const SplashScreen(),
      ),
    );
  }
}

final tokenProvider = FutureProvider<String?>((ref) async {
  return getIt.get<FlutterSecureStorage>().read(key: Constants.authToken);
});
