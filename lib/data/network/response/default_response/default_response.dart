import 'package:boxting/data/network/response/error_response/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse {

  DefaultResponse({
    this.success = false,
    this.data,
    this.error,
  });
  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);
  final bool success;
  final String? data;
  final ErrorResponse? error;
}
