import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable()
class ResultResponse {
  final bool success;
  final ResultResponseData data;

  ResultResponse(this.success, this.data);

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);
}

@JsonSerializable()
class ResultResponseData {
  final num totalVotes;
  final ResultElectionResponse election;
  final List<ResultCandidateResponseData> candidates;

  ResultResponseData(this.totalVotes, this.election, this.candidates);

  factory ResultResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseDataFromJson(json);
}

@JsonSerializable()
class ResultElectionResponse {
  final String id;
  final String name;

  ResultElectionResponse(this.id, this.name);

  factory ResultElectionResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultElectionResponseFromJson(json);
}

@JsonSerializable()
class ResultCandidateResponseData {
  final String electionId;
  final String firstName;
  final String id;
  final String imageUrl;
  final String lastName;
  final String type;
  final num voteCount;

  ResultCandidateResponseData(
    this.electionId,
    this.firstName,
    this.id,
    this.imageUrl,
    this.lastName,
    this.type,
    this.voteCount,
  );

  factory ResultCandidateResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResultCandidateResponseDataFromJson(json);
}
