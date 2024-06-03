import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'event_response.g.dart';

@JsonSerializable()
class EventsResponse {
  final bool success;
  final List<EventResponseData>? data;
  final ErrorResponse? error;

  EventsResponse({
    this.success = false,
    this.data,
    this.error,
  });
  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);
}

@JsonSerializable()
class SingleEventResponse {
  final bool success;
  final EventResponseData? data;
  final ErrorResponse? error;

  SingleEventResponse({
    this.success = false,
    this.data,
    this.error,
  });
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
  final num eventStatus;

  String get status {
    switch (eventStatus) {
      case 1:
        return 'No ha empezado';
      case 2:
        return 'En progreso';
      case 3:
        return 'Finalizado';
      case 4:
        return 'Edición cerrada';
      default:
        return 'No ha empezado';
    }
  }

  EventResponseData({
    required this.id,
    required this.name,
    required this.information,
    required this.startDate,
    required this.endDate,
    required this.code,
    required this.updatedAt,
    required this.eventStatus,
  });

  factory EventResponseData.fromJson(Map<String, dynamic> json) =>
      _$EventResponseDataFromJson(json);
}

extension XString on String {
  String toShortDate() {
    final dateTime = DateTime.tryParse(this)?.toLocal();
    return DateFormat(Constants.minDateFormat).format(dateTime!);
  }

  String toDetailDate() {
    final dateTime = DateTime.tryParse(this)?.toLocal();
    return DateFormat(Constants.detailDateFormat).format(dateTime!);
  }
}
