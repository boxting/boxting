import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vote_response.g.dart';

@JsonSerializable()
class VoteResponse {
  final bool success;
  final VoteResponseData data;

  VoteResponse(this.success, this.data);

  factory VoteResponse.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseFromJson(json);
}

@JsonSerializable()
class VoteResponseData {
  final ResultElectionResponse election;
  final MyVoteResponse vote;

  VoteResponseData(this.election, this.vote);

  factory VoteResponseData.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseDataFromJson(json);
}

@JsonSerializable()
class MyVoteResponse {
  final String id;
  final String electionId;
  final String type;
  final String voterId;
  final List<SelectedCandidateResponse> selectedCandidates;

  MyVoteResponse(
    this.id,
    this.electionId,
    this.type,
    this.voterId,
    this.selectedCandidates,
  );

  factory MyVoteResponse.fromJson(Map<String, dynamic> json) =>
      _$MyVoteResponseFromJson(json);
}

@JsonSerializable()
class SelectedCandidateResponse {
  final String firstName;
  final String imageUrl;
  final String lastName;
  final String type;

  SelectedCandidateResponse(
    this.firstName,
    this.imageUrl,
    this.lastName,
    this.type,
  );

  factory SelectedCandidateResponse.fromJson(Map<String, dynamic> json) =>
      _$SelectedCandidateResponseFromJson(json);
}
