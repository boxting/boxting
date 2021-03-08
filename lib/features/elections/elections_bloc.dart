import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:flutter/material.dart';

class ElectionsBloc extends ChangeNotifier {
  final ElectionsRepository repository;

  ElectionsBloc(this.repository);

  List<ElectionResponseData> _elections;
  List<ElectionResponseData> get elections => _elections;

  Future<void> fetchElectionsFromEvent(String event) async {
    try {
      final result = await repository.fetchElectionsByEvent(event);
      _elections = result.data;
      notifyListeners();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<SingleElectionResponse> fetchElectionById(
    String event,
    String election,
  ) async {
    try {
      final result = await repository.fetchElectionsById(event, election);
      return result;
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
