import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:boxting/features/my_vote/providers.dart';
import 'package:boxting/widgets/boxting_appbar.dart';
import 'package:boxting/widgets/boxting_scaffold.dart';
import 'package:boxting/widgets/error_screen.dart';
import 'package:boxting/widgets/loading_screen.dart';
import 'package:boxting/widgets/styles.dart';
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tú voto para ${data.election.name}',
            style: titleTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 30),
          Text(
            'El identificador de tu voto es ${data.vote.voterId}',
            style: subTitleTextStyle,
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: data.vote.selectedCandidates.length,
              itemBuilder: (context, index) => SelectedCandidate(
                data.vote.selectedCandidates[index],
                data.vote.voterId,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SelectedCandidate extends HookWidget {
  final SelectedCandidateResponse candidate;
  final String voteId;

  SelectedCandidate(this.candidate, this.voteId);

  final NOT_AVAILABLE_IMAGE =
      'https://corp.sellerscommerce.com//SCAssets/images/noimage.png';

  @override
  Widget build(BuildContext context) {
    final image =
        candidate.imageUrl == 'none' ? NOT_AVAILABLE_IMAGE : candidate.imageUrl;
    return ListTile(
      leading: Image.network(image, width: 48, height: 48),
      title: Text('${candidate.firstName} ${candidate.lastName}'),
      subtitle: Text('Identificador del voto: ${voteId}'),
    );
  }
}
