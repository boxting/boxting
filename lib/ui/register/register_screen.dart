import 'package:boxting/data/repository/register_repository_impl.dart';
import 'package:boxting/ui/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterBloc(registerRepository: RegisterRepositoryImpl()),
      builder: (_, __) => RegisterScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
