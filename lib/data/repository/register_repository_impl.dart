import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/domain/repository/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final BoxtingClient boxtingClient;

  RegisterRepositoryImpl({@required this.boxtingClient});

  @override
  Future<bool> registerUser(
    String name,
    String lastname,
    String dni,
    String phone,
    String mail,
    String username,
    String password,
  ) async {
    try {
      final registerRequest = RegisterRequest(
        username: username,
        password: password,
        mail: mail,
        voter: VoterRequest(
          dni: dni,
          phone: phone,
          firstName: name,
          lastName: lastname,
        ),
      );
      final registerResponse = await boxtingClient.register(registerRequest);
      // TODO: Save user information
      return registerResponse.success;
    } on DioError catch (e) {
      final statusCodeError = e.response.data['error']['errorCode'];
      throw BoxtingFailure(statusCode: statusCodeError ?? 999);
    }
  }

  @override
  Future<DniResponseData> fetchInformationFromReniec(String dni) async {
    try {
      final dniResponse = await boxtingClient.getDniInformation(dni);
      if (dniResponse.error != null) {
        throw Exception();
      }
      return dniResponse.data;
    } catch (e) {
      throw BoxtingFailure(statusCode: 999);
    }
  }
}
