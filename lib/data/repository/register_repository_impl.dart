import 'package:boxting/data/network/auth_api.dart';
import 'package:boxting/domain/repository/register_repository.dart';
import 'package:flutter/material.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final AuthenticationApi authenticationApi;

  RegisterRepositoryImpl({@required this.authenticationApi});

  @override
  Future<bool> registerUser(
    String name,
    String lastname,
    String dni,
    String phone,
    String email,
    String username,
    String password,
  ) async {
    final registerResponse = await authenticationApi.register(
      name,
      lastname,
      username,
      password,
      dni,
      email,
      phone,
    );
    // TODO: Save user information
    return registerResponse.success;
  }
}
