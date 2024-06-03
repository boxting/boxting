import 'package:json_annotation/json_annotation.dart';
part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String name;
  final String message;
  final int statusCode;
  final int errorCode;

  ErrorResponse({
    required this.name,
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
