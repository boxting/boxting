import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vote_response.g.dart';

@JsonSerializable()
class VoteResponse {

  VoteResponse(this.success, this.data);

  factory VoteResponse.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseFromJson(json);
  final bool success;
  final VoteResponseData data;
}

@JsonSerializable()
class VoteResponseData {

  VoteResponseData(this.election, this.vote);

  factory VoteResponseData.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseDataFromJson(json);
  final ResultElectionResponse election;
  final MyVoteResponse vote;
}

@JsonSerializable()
class MyVoteResponse {

  MyVoteResponse(
    this.id,
    this.electionId,
    this.type,
    this.voterId,
    this.selectedCandidates,
  );

  factory MyVoteResponse.fromJson(Map<String, dynamic> json) =>
      _$MyVoteResponseFromJson(json);
  final String id;
  final String electionId;
  final String type;
  final String voterId;
  final List<SelectedCandidateResponse> selectedCandidates;
}

@JsonSerializable()
class SelectedCandidateResponse {

  SelectedCandidateResponse(
    this.firstName,
    this.imageUrl,
    this.lastName,
    this.type,
  );

  factory SelectedCandidateResponse.fromJson(Map<String, dynamic> json) =>
      _$SelectedCandidateResponseFromJson(json);
  final String firstName;
  final String imageUrl;
  final String lastName;
  final String type;
}
