import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  final String mail;
  final String phone;
  final String birthday;

  UpdateProfileRequest(this.mail, this.phone, this.birthday);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
