import 'package:json_annotation/json_annotation.dart';
part 'emit_vote_request.g.dart';
@JsonSerializable()
class EmitVoteRequest{
  final List<String> candidates;

  EmitVoteRequest(this.candidates);
  Map<String, dynamic> toJson() => _$EmitVoteRequestToJson(this);
}
