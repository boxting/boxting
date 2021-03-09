import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'event_response.g.dart';

@JsonSerializable()
class EventsResponse {
  final bool success;
  final List<EventResponseData> data;
  final ErrorResponse error;

  EventsResponse({this.success, this.data, this.error});
  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);
}

@JsonSerializable()
class SingleEventResponse {
  final bool success;
  final EventResponseData data;
  final ErrorResponse error;

  SingleEventResponse({this.success, this.data, this.error});
  factory SingleEventResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleEventResponseFromJson(json);
}

@JsonSerializable()
class EventResponseData {
  final int id;
  final String name;
  final String information;
  final String startDate;
  final String endDate;
  final String code;
  final String updatedAt;

  EventResponseData({
    this.id,
    this.name,
    this.information,
    this.startDate,
    this.endDate,
    this.code,
    this.updatedAt,
  });

  factory EventResponseData.fromJson(Map<String, dynamic> json) =>
      _$EventResponseDataFromJson(json);
}

extension XString on String {
  String toShortDate() {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return 'Fecha desconocida';
    return DateFormat('dd/MM').format(dateTime);
  }

  String toDetailDate() {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return 'Fecha desconocida';
    return DateFormat('dd/MM/yyyy hh:mm:ss').format(dateTime);
  }
}
