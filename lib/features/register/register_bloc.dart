import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';

import 'package:flutter/material.dart';

enum RegisterState { initial, loading }

class RegisterBloc extends ChangeNotifier {
  final AuthRepository authRepository;

  var registerState = RegisterState.initial;
  BoxtingFailure _boxtingFailure;
  BoxtingFailure get failure => _boxtingFailure;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  RegisterBloc({@required this.authRepository});

  Future<bool> register() async {
    try {
      _loadingNotifier();
      final loginResponse = await authRepository.registerUser(
        nameController.text.trim(),
        lastnameController.text.trim(),
        dniController.text.trim(),
        phoneController.text.trim(),
        mailController.text.trim(),
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
      _successNotifier();
      return loginResponse;
    } catch (e) {
      _errorNotifier(e);
      return false;
    }
  }

  Future<DniResponseData> retrieveIdentifierInformation(
      String identifier) async {
    try {
      _loadingNotifier();
      final result =
          await authRepository.fetchInformationFromReniec(identifier);
      _successNotifier();
      return result;
    } on BoxtingFailure catch (e) {
      _errorNotifier(e);
      throw BoxtingFailure(statusCode: e.statusCode);
    }
  }

  void _successNotifier() {
    registerState = RegisterState.initial;
    notifyListeners();
  }

  void _loadingNotifier() {
    _boxtingFailure = null;
    registerState = RegisterState.loading;
    notifyListeners();
  }

  void _errorNotifier(Exception e) {
    registerState = RegisterState.initial;
    _boxtingFailure = e;
    notifyListeners();
  }
}
