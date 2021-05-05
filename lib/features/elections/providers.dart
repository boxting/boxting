import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:equatable/equatable.dart';

final electionsFromEventProvider = FutureProvider.autoDispose
    .family<ElectionResponseData, String>((ref, event) async {
  try {
    final repository = ref.watch(electionRepositoryProvider);
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
    final repository = ref.watch(electionRepositoryProvider);
    final result = await repository.fetchElectionsById(req.event, req.election);
    return result.data;
  } on BoxtingException catch (e) {
    throw Exception(e.message);
  }
});

class ElectionDetailRequest extends Equatable {
  final String election;
  final String event;

  const ElectionDetailRequest(this.event, this.election);

  @override
  List<Object> get props => [event, election];
}
