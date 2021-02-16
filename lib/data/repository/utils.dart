import 'package:boxting/data/error/error_handler.dart';

extension XInt on int {
  int orDefaultErrorCode() => this ?? UNKNOWN_ERROR;
}

T cast<T>(x) => x is T ? x : null;
