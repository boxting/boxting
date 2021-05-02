import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/emit_vote_request/emit_vote_request.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:boxting/domain/repository/voting_repository.dart';

class VotingRepositoryImpl extends VotingRepository {
  final BoxtingClient boxtingClient;

  VotingRepositoryImpl(this.boxtingClient);

  @override
  Future<DefaultResponse> emitVoteForElection(
    String election,
    List<String> candidates,
  ) async {
    final request = EmitVoteRequest(candidates);
    final response = await boxtingClient.emitVote(election, request);
    return response;
  }

  @override
  Future<ResultResponse> getResultByElection(String election) async {
    return await boxtingClient.getResultsByElection(election);
  }

  @override
  Future<VoteResponse> getMyVoteFromElection(String election) async {
    return await boxtingClient.getMyVoteFromElection(election);
  }
}
