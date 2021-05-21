import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:boxting/domain/constants/constants.dart';
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
  final num eventStatus;

  String get status {
    switch (eventStatus) {
      case 1:
        return 'No ha empezado';
        break;
      case 2:
        return 'En progreso';
        break;
      case 3:
        return 'Finalizado';
        break;
      case 4:
        return 'Edición cerrada';
        break;
      default:
        return 'No ha empezado';
    }
  }

  EventResponseData({
    this.id,
    this.name,
    this.information,
    this.startDate,
    this.endDate,
    this.code,
    this.updatedAt,
    this.eventStatus,
  });

  factory EventResponseData.fromJson(Map<String, dynamic> json) =>
      _$EventResponseDataFromJson(json);
}

extension XString on String {
  String toShortDate() {
    final dateTime = DateTime.tryParse(this).toLocal();
    if (dateTime == null) return 'Fecha desconocida';
    return DateFormat(Constants.MIN_DATE_FORMAT).format(dateTime);
  }

  String toDetailDate() {
    final dateTime = DateTime.tryParse(this).toLocal();
    if (dateTime == null) return 'Fecha desconocida';
    return DateFormat(Constants.DETAIL_DATE_FORMAT).format(dateTime);
  }
}
