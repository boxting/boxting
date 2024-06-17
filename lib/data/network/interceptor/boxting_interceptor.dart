import 'dart:io';

import 'package:boxting/domain/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

extension XString on String? {
  String orEmpty() => this ?? '';
}

class BoxtingInterceptors extends InterceptorsWrapper {
  BoxtingInterceptors({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.read(key: Constants.authToken);
    options.headers[Constants.authHeader] =
        Constants.authBearer + token.orEmpty();
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      await _secureStorage.write(key: Constants.authToken, value: null);
    }
    super.onError(err, handler);
  }
}
