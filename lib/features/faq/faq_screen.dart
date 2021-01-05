import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';

class FaqScreen extends HookWidget {
  Future<String> fetchFrequentQuestions() async {
    final remoteConfig = await RemoteConfig.instance;
    await Future.delayed(Duration(seconds: 3));
    await remoteConfig.fetch(expiration: const Duration(seconds: 1));
    await remoteConfig.activateFetched();
    return remoteConfig.getString('FAQ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preguntas frecuentes')),
      body: FutureBuilder(
        future: fetchFrequentQuestions(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Html(data: snapshot.data),
            );
          }
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading_vote.json',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}