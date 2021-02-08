import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

extension XString on String {
  String orEmpty() => this ?? '';
}

class BoxtingInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print('REQUEST[${options?.method}] => PATH: ${options?.path}');
    print(options?.data);
    final token =
        await getIt.get<FlutterSecureStorage>().read(key: Constants.AUTH_TOKEN);
    options.headers[Constants.AUTH_HEADER] =
        Constants.AUTH_BEARER + token.orEmpty();
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.request.path}');
    print(response?.data);
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}');
    print(err?.response?.data);
    return super.onError(err);
  }
}
