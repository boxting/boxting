import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/voting_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VoteRequest extends Equatable {
  final List<String> candidates;
  final String election;

  VoteRequest(this.candidates, this.election);

  @override
  List<Object> get props => [candidates, election];
}

final votingElectionProvider = StateNotifierProvider<VotingElection>((ref) {
  final repository = ref.watch(votingRepositoryProvider);
  return VotingElection(repository, ref);
});

class VotingElection extends StateNotifier {
  VotingElection(this.repository, this.ref) : super(null);

  final VotingRepository repository;
  final ProviderReference ref;

  void emitVote(VoteRequest req) async {
    try {
      await repository.emitVoteForElection(req.election, req.candidates);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
