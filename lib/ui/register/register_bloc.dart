import 'package:boxting/domain/repository/register_repository.dart';
import 'package:flutter/material.dart';

enum RegisterState { initial, loading }

class RegisterBloc extends ChangeNotifier {
  final RegisterRepository registerRepository;

  RegisterBloc({@required this.registerRepository});
}
