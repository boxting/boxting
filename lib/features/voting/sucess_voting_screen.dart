import 'package:boxting/widgets/navigation.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/success_vote.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SuccessVotingScreen extends HookWidget {
  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => SuccessVotingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Voto exitoso', style: titleTextStyle),
            SuccessVote(),
            BoxtingButton(
              child: Text('Volver'),
              onPressed: () {
                // TODO: Refresh election detail screeen
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
