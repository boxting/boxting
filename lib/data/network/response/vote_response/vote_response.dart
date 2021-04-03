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
  final String electionId;
  final String id;
  final String type;
  final String voterId;
  final List<SelectedCandidateResponse> selectedCandidates;

  VoteResponseData(
    this.electionId,
    this.id,
    this.type,
    this.voterId,
    this.selectedCandidates,
  );

  factory VoteResponseData.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseDataFromJson(json);
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
