import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CandidateDetailRequest extends Equatable {
  final String candidate;
  final String listId;

  const CandidateDetailRequest(this.candidate, this.listId);

  @override
  List<Object> get props => [candidate, listId];
}

final fetchCandidateByElection = FutureProvider.autoDispose
    .family<List<CandidateResponseData>, String>((ref, election) async {
  final repository = ref.watch(candidatesRepositoryProvider);
  final result = await repository.fetchCandidatesByElection(election);
  return result.data;
});

final fetchCandidateById = FutureProvider.autoDispose
    .family<CandidateResponseData, CandidateDetailRequest>((ref, req) async {
  final repository = ref.watch(candidatesRepositoryProvider);
  final result = await repository.fetchCandidateById(req.listId, req.candidate);
  return result.data;
});
