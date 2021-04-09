import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:boxting/features/my_vote/providers.dart';
import 'package:boxting/widgets/boxting_appbar.dart';
import 'package:boxting/widgets/boxting_scaffold.dart';
import 'package:boxting/widgets/error_screen.dart';
import 'package:boxting/widgets/loading_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyVoteScreen extends HookWidget {
  final String election;

  MyVoteScreen(this.election);

  static Future<void> navigate(BuildContext context, String election) async {
    await BoxtingNavigation.goto(context, (_) => MyVoteScreen(election));
  }

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(getMyVoteProvider(election));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: provider.when(
          data: (data) => MyVoteBody(data),
          loading: () => BoxtingLoadingScreen(),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class MyVoteBody extends HookWidget {
  final VoteResponseData data;

  MyVoteBody(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(data.election.name),
          Text('El identificador de tu voto es ${data.vote.voterId}')
        ],
      ),
    );
  }
}
