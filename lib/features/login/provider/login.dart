import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/response/login_response/login_response.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

@riverpod
class Login extends _$Login {
  @override
  FutureOr<LoginResponseData> build(String username, String password) async {
    final _authRepository = ref.read(authRepositoryProvider);
    final loginRequest = LoginRequest(username: username, password: password);
    final result = await _authRepository.login(loginRequest);
    return await result.fold(
      (failure) => throw Exception(failure),
      (data) => data,
    );
  }
}
