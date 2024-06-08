import 'package:boxting/data/network/boxting_client.dart';
import 'package:boxting/data/network/interceptor/boxting_interceptor.dart';
import 'package:boxting/data/repository/auth_repository_impl.dart';
import 'package:boxting/data/repository/biometric_repository_impl.dart';
import 'package:boxting/data/repository/candidates_repository_impl.dart';
import 'package:boxting/data/repository/elections_repository_impl.dart';
import 'package:boxting/data/repository/event_repository_impl.dart';
import 'package:boxting/data/repository/voting_repository_impl.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/domain/repository/biometric_repository.dart';
import 'package:boxting/domain/repository/candidates_repository.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:boxting/domain/repository/event_repository.dart';
import 'package:boxting/domain/repository/voting_repository.dart';
import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/forgot_password/forgot_password_bloc.dart';
import 'package:boxting/features/login/login_bloc.dart';
import 'package:boxting/features/register/register_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final getIt = GetIt.I;

final dioOptions = BaseOptions(
  connectTimeout: const Duration(seconds: 50),
  receiveTimeout: const Duration(seconds: 30),
);

void setupGetIt() {
  final boxtingClient = _setupNetwork();
  _setupRepositories(boxtingClient);
  _setupBlocs();
  _setupStorage();
}

BoxtingClient _setupNetwork() {
  final dio = Dio(dioOptions);
  dio.interceptors.add(BoxtingInterceptors());
  getIt.registerSingleton<Dio>(dio);
  return BoxtingClient(getIt.get<Dio>());
}

void _setupRepositories(BoxtingClient boxtingClient) {
  getIt
    ..registerSingleton<AuthRepository>(AuthRepositoryImpl(boxtingClient))
    ..registerSingleton<BiometricRepository>(BiometricRepositoryImpl())
    ..registerSingleton<LocalAuthentication>(LocalAuthentication())
    ..registerSingleton<EventRepository>(EventRepositoryImpl(boxtingClient))
    ..registerSingleton<ElectionsRepository>(
      ElectionsRepositoryImpl(boxtingClient),
    )
    ..registerSingleton<CandidatesRepository>(
      CandidatesRepositoryImpl(boxtingClient),
    )
    ..registerSingleton<VotingRepository>(VotingRepositoryImpl(boxtingClient));
}

final authRepositoryProvider = Provider((_) => getIt.get<AuthRepository>());
final eventsRepositoryProvider = Provider((_) => getIt.get<EventRepository>());
final biometricRepositoryProvider = Provider(
  (_) => getIt.get<BiometricRepository>(),
);
final electionRepositoryProvider = Provider(
  (_) => getIt.get<ElectionsRepository>(),
);
final candidatesRepositoryProvider =
    Provider((_) => getIt.get<CandidatesRepository>());

final votingRepositoryProvider = Provider((_) => getIt.get<VotingRepository>());

final localAuthProvider = Provider((_) => LocalAuthentication());

void _setupBlocs() {
  getIt
    ..registerSingleton<ForgotPasswordBloc>(
      ForgotPasswordBloc(authRepository: getIt.get<AuthRepository>()),
    )
    ..registerSingleton<RegisterBloc>(
      RegisterBloc(authRepository: getIt.get<AuthRepository>()),
    )
    ..registerSingleton<BiometricBloc>(
      BiometricBloc(
        getIt.get<BiometricRepository>(),
        getIt.get<LocalAuthentication>(),
      ),
    )
    ..registerSingleton<LoginBloc>(
      LoginBloc(
        authRepository: getIt.get<AuthRepository>(),
        biometricRepository: getIt.get<BiometricRepository>(),
      ),
    );
}

void _setupStorage() {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
}

void setupGetItTesting() {
  getIt.registerSingleton<Dio>(Dio(dioOptions));
}
