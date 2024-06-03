import 'package:boxting/data/error/error_handler.dart';

extension XInt on int? {
  int orDefaultErrorCode() => this ?? unknownError;
}
