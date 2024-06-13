import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password.g.dart';

@riverpod
FutureOr<bool> forgotPassword(ForgotPasswordRef ref, String email) async {
  final _repository = ref.watch(authRepositoryProvider);
  final forgotPasswordRequest = ForgotPasswordRequest(mail: email);
  final response = await _repository.sendForgotPassword(forgotPasswordRequest);
  return response.success;
}
