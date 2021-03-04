import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:flutter/material.dart';

class ElectionsBloc extends ChangeNotifier {
  final ElectionsRepository electionsRepository;

  ElectionsBloc(this.electionsRepository);

  List<ElectionResponseData> _elections;
  List<ElectionResponseData> get elections => _elections;

  Future<void> fetchElectionsFromEvent(String event) async {
    try {
      final result = await electionsRepository.fetchElectionsByEvent(event);
      _elections = result.data;
      notifyListeners();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
