import 'package:boxting/widgets/widgets.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsScreen extends HookWidget {
  Future<String> fetchTerms() async {
    final remoteConfig = await RemoteConfig.instance;
    await Future.delayed(Duration(seconds: 3));
    await remoteConfig.fetch(expiration: const Duration(days: 1));
    await remoteConfig.activateFetched();
    return remoteConfig.getString('terms');
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: AppBar(title: Text('Terminos y condiciones')),
      body: FutureBuilder(
        future: fetchTerms(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Html(data: snapshot.data),
            );
          }
          return BoxtingLoadingScreen();
        },
      ),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => TermsScreen());
  }
}
