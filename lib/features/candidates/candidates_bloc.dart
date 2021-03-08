import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/domain/repository/candidates_repository.dart';
import 'package:flutter/material.dart';

class CandidatesBloc extends ChangeNotifier {
  final CandidatesRepository repository;

  CandidatesBloc(this.repository);

  Future<List<CandidateResponseData>> fetchCandidatesByElection(
      String election) async {
    try {
      final result = await repository.fetchCandidatesByElection(election);
      return result.data;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<CandidateResponseData> fetchCandidateById(
    String candidate,
    String listId,
  ) async {
    try {
      final result = await repository.fetchCandidateById(candidate, listId);
      return result.data;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
