import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getMyVoteProvider = FutureProvider.autoDispose
    .family<VoteResponseData, String>((ref, election) async {
  try {
    final repository = ref.watch(votingRepositoryProvider);
    final result = await repository.getMyVoteFromElection(election);
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});
