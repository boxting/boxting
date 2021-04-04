import 'dart:convert';

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
    final response = '''
    {
      "success": true,
      "data": [
          {
              "electionId": "1",
              "firstName": "Rodrigo",
              "id": "1",
              "imageUrl": "none",
              "lastName": "Guadalupe",
              "type": "votable",
              "voteCount": 2
          },
          {
              "electionId": "1",
              "firstName": "Enzo",
              "id": "2",
              "imageUrl": "none",
              "lastName": "Lizama",
              "type": "votable",
              "voteCount": 0
          }
      ]
    }
    ''';
    return ResultResponse.fromJson(json.decode(response));
  }

  @override
  Future<VoteResponse> getMyVoteFromElection(String election) async {
    await Future.delayed(Duration(seconds: 2));
    final response = '''
    {
      "success": true,
      "data": {
          "electionId": "1",
          "id": "49tghqnh3aa2lxwd990br7",
          "selectedCandidates": [
              {
                  "electionId": "1",
                  "firstName": "Rodrigo",
                  "imageUrl": "none",
                  "lastName": "Guadalupe",
                  "type": "votable"
              }
          ],
          "type": "vote",
          "voterId": "70148943"
      }
    }
    ''';
    return VoteResponse.fromJson(json.decode(response));
  }
}
