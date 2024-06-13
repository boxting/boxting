import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_user.g.dart';

@riverpod
FutureOr<bool> registerUser(
  RegisterUserRef ref,
  RegisterRequest request,
) async {
  final _repository = ref.watch(authRepositoryProvider);
  return await _repository.registerUser(request);
}
