import 'package:json_annotation/json_annotation.dart';
part 'emit_vote_request.g.dart';

@JsonSerializable()
class EmitVoteRequest{

  EmitVoteRequest(this.candidates);
  final List<String> candidates;
  Map<String, dynamic> toJson() => _$EmitVoteRequestToJson(this);
}
