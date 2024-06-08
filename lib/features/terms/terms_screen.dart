import 'package:boxting/widgets/widgets.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsScreen extends HookWidget {
  const TermsScreen({super.key});

  Future<String> fetchTerms() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await Future.delayed(const Duration(seconds: 3));
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    return remoteConfig.getString('terms');
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: AppBar(title: const Text('Terminos y condiciones')),
      body: FutureBuilder(
        future: fetchTerms(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(child: Html(data: snapshot.data)),
            );
          }
          return const BoxtingLoadingScreen();
        },
      ),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => const TermsScreen());
  }
}
