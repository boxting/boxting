import 'package:boxting/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<bool> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
