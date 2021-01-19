import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/repository/login_repository_impl.dart';
import 'package:boxting/data/repository/register_repository_impl.dart';
import 'package:boxting/data/repository/settings_repository_impl.dart';
import 'package:boxting/domain/repository/login_repository.dart';
import 'package:boxting/domain/repository/register_repository.dart';
import 'package:boxting/domain/repository/settings_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

final options = BaseOptions(
  connectTimeout: 50000,
  receiveTimeout: 30000,
  validateStatus: (status) => status < 500,
);

void setupGetIt() {
  getIt.registerSingleton<Dio>(Dio(options));
  final boxtingClient = BoxtingClient(getIt.get<Dio>());
  getIt.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(boxtingClient: boxtingClient),
  );
  getIt.registerSingleton<RegisterRepository>(
    RegisterRepositoryImpl(boxtingClient: boxtingClient),
  );
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl());
}

void setupGetItTesting() {
  getIt.registerSingleton<Dio>(Dio(options));
}
