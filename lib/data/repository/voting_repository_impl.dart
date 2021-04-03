import 'package:boxting/data/network/boxting_client.dart';
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
    await Future.delayed(Duration(seconds: 2));
    return DefaultResponse(success: true, data: 'Voto exitoso', error: null);
  }

  @override
  Future<ResultResponse> getResultByElection(String election) async {
    await Future.delayed(Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<VoteResponse> getMyVoteFromElection(String election) async {
    await Future.delayed(Duration(seconds: 2));
    throw UnimplementedError();
  }
}
