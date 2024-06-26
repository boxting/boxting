import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:boxting/features/my_vote/providers.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyVoteScreen extends HookConsumerWidget {

  const MyVoteScreen(this.election, {super.key});
  final String election;

  static Future<void> navigate(BuildContext context, String election) async {
    await BoxtingNavigation.goto(context, (_) => MyVoteScreen(election));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(getMyVoteProvider(election));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: provider.when(
          data: MyVoteBody.new,
          loading: () => const BoxtingLoadingScreen(),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class MyVoteBody extends HookWidget {

  const MyVoteBody(this.data, {super.key});
  final VoteResponseData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tú voto para ${data.election.name}',
            style: titleTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 30),
          Text(
            'El identificador de tu voto es ${data.vote.id}',
            style: subTitleTextStyle,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: data.vote.selectedCandidates.length,
              itemBuilder: (context, index) => SelectedCandidate(
                data.vote.selectedCandidates[index],
                data.vote.voterId,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedCandidate extends HookWidget {

  const SelectedCandidate(this.candidate, this.voteId, {super.key});
  final SelectedCandidateResponse candidate;
  final String voteId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${candidate.firstName} ${candidate.lastName}'),
      subtitle: Text('Identificador del voto: $voteId'),
    );
  }
}
