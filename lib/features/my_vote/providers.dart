import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:boxting/features/login/provider/token.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getMyVoteProvider = FutureProvider.autoDispose
    .family<VoteResponseData, String>((ref, election) async {
  try {
    final repository = ref.watch(votingRepositoryProvider);
    final result = await repository.getMyVoteFromElection(election);
    return result.data;
  } on BoxtingException catch (e) {
    ref.container.refresh(tokenProvider);
    throw Exception(e.message);
  }
});
