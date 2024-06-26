import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends ChangeNotifier {
  RegisterBloc({required this.authRepository}) {
    _registerRequest = RegisterRequest();
  }
  final AuthRepository authRepository;

  late BoxtingException _boxtingFailure;
  BoxtingException get failure => _boxtingFailure;

  late RegisterRequest _registerRequest;

  Future<void> _register() async {
    try {
      await authRepository.registerUser(_registerRequest);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }

  void registerIdentifierInformation(DniResponseData data) {
    _registerRequest.voter?.dni = data.dni;
    _registerRequest.voter?.firstName = data.names;
    _registerRequest.voter?.lastName =
        '${data.fatherLastname} ${data.motherLastname}';
  }

  Future<void> registerPersonalInformation(
    String mail,
    String phone,
    String username,
  ) async {
    _registerRequest
      ..username = username
      ..mail = mail;
    _registerRequest.voter?.phone = phone;
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
      registerIdentifierInformation(result);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
