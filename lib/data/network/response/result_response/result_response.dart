import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable()
class ResultResponse {
  ResultResponse({required this.success, required this.data});

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);
  final bool success;
  final ResultResponseData data;
}

@JsonSerializable()
class ResultResponseData {
  ResultResponseData(this.totalVotes, this.election, this.candidates);

  factory ResultResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseDataFromJson(json);
  final num totalVotes;
  final ResultElectionResponse election;
  final List<ResultCandidateResponseData> candidates;
}

@JsonSerializable()
class ResultElectionResponse {
  ResultElectionResponse(this.id, this.name);

  factory ResultElectionResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultElectionResponseFromJson(json);
  final String id;
  final String name;
}

@JsonSerializable()
class ResultCandidateResponseData {
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
  final String electionId;
  final String firstName;
  final String id;
  final String imageUrl;
  final String lastName;
  final String type;
  final num voteCount;
}
