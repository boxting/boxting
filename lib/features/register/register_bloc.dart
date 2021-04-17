import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';

import 'package:flutter/material.dart';

class RegisterBloc extends ChangeNotifier {
  final AuthRepository authRepository;

  BoxtingException _boxtingFailure;
  BoxtingException get failure => _boxtingFailure;

  RegisterRequest _registerRequest;

  RegisterBloc({@required this.authRepository}) {
    _registerRequest = RegisterRequest();
  }

  Future<void> _register() async {
    try {
      return await authRepository.registerUser(_registerRequest);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  void _registerIdentifierInformation(DniResponseData data) {
    _registerRequest.voter.dni = data.dni;
    _registerRequest.voter.firstName = data.names;
    _registerRequest.voter.lastName = data.fatherLastname + data.motherLastname;
  }

  Future<void> registerPersonalInformation(
    String mail,
    String phone,
    String username,
  ) async {
    _registerRequest.username = username;
    _registerRequest.mail = mail;
    _registerRequest.voter.phone = phone;
  }

  Future<void> registerPassword(String password) async {
    try {
      _registerRequest.password = password;
      await _register();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> retrieveIdentifierInformation(
    String identifier,
  ) async {
    try {
      final result =
          await authRepository.fetchInformationFromReniec(identifier);
      if (result.used) {
        throw Exception('El DNI ingresado ya esta registrado');
      }
      _registerIdentifierInformation(result);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
