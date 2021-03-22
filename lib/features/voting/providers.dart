import 'package:boxting/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emitVoteProvider =
    FutureProvider.autoDispose.family<void, VoteRequest>((ref, req) async {
  final repository = ref.watch(votingRepositoryProvider);
  await repository.emitVoteForElection(req.election, req.candidates);
});

class VoteRequest extends Equatable {
  final List<String> candidates;
  final String election;

  VoteRequest(this.candidates, this.election);

  @override
  List<Object> get props => throw UnimplementedError();
}
