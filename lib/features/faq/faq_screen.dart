import 'package:boxting/widgets/widgets.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';

class FaqScreen extends HookWidget {
  const FaqScreen({super.key});

  Future<String> fetchFrequentQuestions() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    return remoteConfig.getString('faq');
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: AppBar(title: const Text('Preguntas frecuentes')),
      body: FutureBuilder(
        future: fetchFrequentQuestions(),
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
}
