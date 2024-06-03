import 'dart:io';

import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

extension XString on String? {
  String orEmpty() => this ?? '';
}

class BoxtingInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final storage = getIt.get<FlutterSecureStorage>();
    final token = await storage.read(key: Constants.authToken);
    options.headers[Constants.authHeader] =
        Constants.authBearer + token.orEmpty();
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      getIt
          .get<FlutterSecureStorage>()
          .write(key: Constants.authToken, value: null);
    }
    super.onError(err, handler);
  }
}
