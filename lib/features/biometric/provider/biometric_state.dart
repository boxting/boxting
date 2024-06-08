import 'package:equatable/equatable.dart';

sealed class BiometricState extends Equatable {
  const BiometricState();
  @override
  List<Object?> get props => [];
}

final class BiometricInitial extends BiometricState {
  const BiometricInitial();
}

final class BiometricSuccess extends BiometricState {
  const BiometricSuccess();
}

final class BiometricError extends BiometricState {
  const BiometricError();
}
