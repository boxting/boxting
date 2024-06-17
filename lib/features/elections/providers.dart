import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final electionsFromEventProvider = FutureProvider.autoDispose
    .family<ElectionResponseData, String>((ref, event) async {
  try {
    final repository = ref.read(electionsRepositoryProvider);
    final result = await repository.fetchElectionsByEvent(event);
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});

final electionDetailProvider = FutureProvider.autoDispose
    .family<ElectionElementResponseData, ElectionDetailRequest>(
        (ref, req) async {
  try {
    final repository = ref.watch(electionsRepositoryProvider);
    final result = await repository.fetchElectionsById(req.event, req.election);
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});

class ElectionDetailRequest extends Equatable {
  const ElectionDetailRequest(this.event, this.election);
  final String election;
  final String event;

  @override
  List<Object> get props => [event, election];
}
