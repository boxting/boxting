import 'package:json_annotation/json_annotation.dart';
part 'elections_response.g.dart';

@JsonSerializable()
class ElectionsResponse {
  final bool success;
  final ElectionResponseData data;

  ElectionsResponse({this.success, this.data});
  factory ElectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectionsResponseFromJson(json);
}

@JsonSerializable()
class SingleElectionResponse {
  final bool success;
  final ElectionElementResponseData data;

  SingleElectionResponse({this.success, this.data});

  factory SingleElectionResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleElectionResponseFromJson(json);
}

@JsonSerializable()
class ElectionResponseData {
  final num eventStatus;
  final List<ElectionElementResponseData> elements;

  ElectionResponseData(this.eventStatus, this.elements);

  factory ElectionResponseData.fromJson(Map<String, dynamic> json) =>
      _$ElectionResponseDataFromJson(json);
}

@JsonSerializable()
class ElectionElementResponseData {
  final int id;
  final String name;
  final String information;
  final int winners;
  final int eventId;
  final int typeId;
  final String updatedAt;
  final String createdAt;
  final bool userVoted;

  ElectionElementResponseData({
    this.id,
    this.name,
    this.information,
    this.winners,
    this.eventId,
    this.typeId,
    this.updatedAt,
    this.createdAt,
    this.userVoted,
  });

  factory ElectionElementResponseData.fromJson(Map<String, dynamic> json) =>
      _$ElectionElementResponseDataFromJson(json);
}
