import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_code.g.dart';

@riverpod
FutureOr<bool> verifyCode(
  VerifyCodeRef ref,
  ValidateTokenRequest request,
) async {
  final _repository = ref.watch(authRepositoryProvider);
  final _response = await _repository.validatePasswordToken(request);
  return _response.success;
}
