import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:boxting/data/network/response/vote_response/vote_response.dart';

abstract class VotingRepository {
  Future<DefaultResponse> emitVoteForElection(
    String election,
    List<String> candidates,
  );

  Future<ResultResponse> getResultByElection(String election);

  Future<VoteResponse> getMyVoteFromElection(String election);
}
