import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/domain/repository/register_repository.dart';
import 'package:flutter/material.dart';

enum RegisterState { initial, loading }

class RegisterBloc extends ChangeNotifier {
  final RegisterRepository registerRepository;

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

  RegisterBloc({@required this.registerRepository});

  Future<bool> register() async {
    try {
      _boxtingFailure = null;
      registerState = RegisterState.loading;
      notifyListeners();
      final loginResponse = await registerRepository.registerUser(
        nameController.text.trim(),
        lastnameController.text.trim(),
        dniController.text.trim(),
        phoneController.text.trim(),
        mailController.text.trim(),
        usernameController.text.trim(),
        passwordController.text.trim(),
      );

      registerState = RegisterState.initial;
      notifyListeners();
      return loginResponse;
    } catch (e) {
      registerState = RegisterState.initial;
      _boxtingFailure = e;
      notifyListeners();
      return false;
    }
  }
}
