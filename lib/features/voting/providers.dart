import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/voting_repository.dart';
import 'package:boxting/features/elections/providers.dart';
import 'package:boxting/features/events/providers.dart';
import 'package:boxting/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VoteRequest extends Equatable {
  final List<String> candidates;
  final String election;
  final String event;

  const VoteRequest(this.candidates, this.election, this.event);

  @override
  List<Object> get props => [candidates, election, event];
}

final votingElectionProvider =
    StateNotifierProvider<VotingElection, dynamic>((ref) {
  final repository = ref.watch(votingRepositoryProvider);
  return VotingElection(repository, (req) async {
    await repository.emitVoteForElection(req.election, req.candidates);
    final reqElection = ElectionDetailRequest(req.event, req.election);
    ref.container.refresh(electionDetailProvider(reqElection));
    ref.container.refresh(fetchEventByIdProvider(req.event));
  });
});

class VotingElection extends StateNotifier {
  VotingElection(this.repository, this.callback) : super(null);

  final VotingRepository repository;
  final Function(VoteRequest req) callback;

  void emitVote(VoteRequest req) async {
    try {
      callback.call(req);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
