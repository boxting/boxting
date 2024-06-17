import 'package:json_annotation/json_annotation.dart';
part 'elections_response.g.dart';

@JsonSerializable()
class ElectionsResponse {

  ElectionsResponse({required this.success, required this.data});
  factory ElectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectionsResponseFromJson(json);
  final bool success;
  final ElectionResponseData data;
}

@JsonSerializable()
class SingleElectionResponse {

  SingleElectionResponse({required this.success, required this.data});

  factory SingleElectionResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleElectionResponseFromJson(json);
  final bool success;
  final ElectionElementResponseData data;
}

@JsonSerializable()
class ElectionResponseData {

  ElectionResponseData(this.eventStatus, this.elements);

  factory ElectionResponseData.fromJson(Map<String, dynamic> json) =>
      _$ElectionResponseDataFromJson(json);
  final num eventStatus;
  final List<ElectionElementResponseData> elements;
}

@JsonSerializable()
class ElectionElementResponseData {

  ElectionElementResponseData({
    required this.id,
    required this.name,
    required this.information,
    required this.winners,
    required this.eventId,
    required this.typeId,
    required this.updatedAt,
    required this.createdAt,
    required this.userVoted,
  });

  factory ElectionElementResponseData.fromJson(Map<String, dynamic> json) =>
      _$ElectionElementResponseDataFromJson(json);
  final int id;
  final String name;
  final String information;
  final int winners;
  final int eventId;
  final int typeId;
  final String updatedAt;
  final String createdAt;
  final bool userVoted;
}
