import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dni_response.g.dart';

@JsonSerializable()
class DniResponse {
  DniResponse({
    this.success = false,
    this.data,
    this.error,
  });

  factory DniResponse.fromJson(Map<String, dynamic> json) =>
      _$DniResponseFromJson(json);
  final bool success;
  final DniResponseData? data;
  final ErrorResponse? error;
}

@JsonSerializable()
class DniResponseData {

  DniResponseData({
    required this.dni,
    required this.cui,
    required this.motherLastname,
    required this.fatherLastname,
    required this.names,
    required this.used,
  });

  factory DniResponseData.fromJson(Map<String, dynamic> json) =>
      _$DniResponseDataFromJson(json);
  final String dni;
  final int cui;
  @JsonKey(name: 'apellido_materno')
  final String motherLastname;
  @JsonKey(name: 'apellido_paterno')
  final String fatherLastname;
  @JsonKey(name: 'nombres')
  final String names;
  final bool used;
}
