import 'package:boxting/data/network/response/default_response/default_response.dart';

abstract class VotingRepository {
  Future<DefaultResponse> emitVoteForElection(
    String election,
    List<String> candidates,
  );
}
