import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ProfileBloc extends ChangeNotifier {
  final AuthRepository repository;

  User _user;
  User get user => _user;

  ProfileBloc(this.repository);

  Future<void> getUserInformation() async {
    try {
      final response = await repository.getUserInformation();
      _user = response.data.toUser();
      notifyListeners();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
