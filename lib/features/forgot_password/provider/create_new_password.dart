import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_new_password.g.dart';

@riverpod
FutureOr<bool> createNewPassword(
  CreateNewPasswordRef ref,
  NewPasswordRequest request,
) async {
  final _repository = ref.watch(authRepositoryProvider);
  final _response = await _repository.setNewPassword(request);
  return _response.success;
}
