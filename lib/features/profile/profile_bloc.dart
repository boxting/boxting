import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ProfileBloc extends ChangeNotifier {
  final AuthRepository repository;

  ProfileBloc(this.repository);

  Future<void> getUserInformation() async {
    try {
      await repository.getUserInformation();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
