import 'package:json_annotation/json_annotation.dart';
part 'error_response.g.dart';

@JsonSerializable(nullable: true)
class ErrorResponse {
  final String name;
  final String message;
  final int statusCode;
  final int errorCode;

  ErrorResponse({this.name, this.message, this.statusCode, this.errorCode});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
