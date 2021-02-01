import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/repository/auth_repository_impl.dart';
import 'package:boxting/data/repository/biometric_repository_impl.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

final getIt = GetIt.I;

final options = BaseOptions(
  connectTimeout: 50000,
  receiveTimeout: 30000,
  validateStatus: (status) => status < 500,
);

void setupGetIt() {
  getIt.registerSingleton<Dio>(Dio(options));
  final boxtingClient = BoxtingClient(getIt.get<Dio>());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(boxtingClient));
  getIt.registerSingleton<BiometricRepository>(BiometricRepositoryImpl());
  getIt.registerSingleton<LocalAuthentication>(LocalAuthentication());
}

void setupGetItTesting() {
  getIt.registerSingleton<Dio>(Dio(options));
}
