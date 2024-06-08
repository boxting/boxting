import 'package:equatable/equatable.dart';

sealed class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashToLogin extends SplashState {
  const SplashToLogin();
}

final class SplashToOnBoarding extends SplashState {
  const SplashToOnBoarding();
}
