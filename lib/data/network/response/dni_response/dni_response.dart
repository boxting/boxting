import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dni_response.g.dart';

@JsonSerializable()
class DniResponse {
  final bool success;
  final DniResponseData data;
  final ErrorResponse error;
  DniResponse({this.success, this.data, this.error});

  factory DniResponse.fromJson(Map<String, dynamic> json) =>
      _$DniResponseFromJson(json);
}

@JsonSerializable(nullable: true)
class DniResponseData {
  final String dni;
  final int cui;
  @JsonKey(name: 'apellido_materno')
  final String motherLastname;
  @JsonKey(name: 'apellido_paterno')
  final String fatherLastname;
  @JsonKey(name: 'nombres')
  final String names;
  final bool used;

  DniResponseData({
    this.dni,
    this.cui,
    this.motherLastname,
    this.fatherLastname,
    this.names,
    this.used,
  });

  factory DniResponseData.fromJson(Map<String, dynamic> json) =>
      _$DniResponseDataFromJson(json);
}
