import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {

  UpdateProfileRequest(this.mail, this.phone, this.birthday);
  final String mail;
  final String phone;
  final String birthday;

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
