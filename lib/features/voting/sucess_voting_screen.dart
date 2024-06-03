import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/success_vote.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SuccessVotingScreen extends HookWidget {
  const SuccessVotingScreen({super.key});

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => const SuccessVotingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'El voto se registró correctamente',
              style: titleTextStyle,
            ),
            const SuccessVote(),
            BoxtingButton(
              child: const Text('Volver'),
              onPressed: () {
                BoxtingNavigation.pop(context);
                BoxtingNavigation.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
