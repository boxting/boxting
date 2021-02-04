import 'package:dio/dio.dart';

class BoxtingInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print('REQUEST[${options?.method}] => PATH: ${options?.path}');
    print(options?.data);
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        'RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}');
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
