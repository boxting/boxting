import 'package:boxting/data/network/request/refresh_token_request/refresh_token_request.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as ss;

extension XString on String {
  String orEmpty() => this ?? '';
}

class BoxtingInterceptors extends InterceptorsWrapper {
  final Dio dio;

  BoxtingInterceptors(this.dio);

  @override
  Future onRequest(RequestOptions options) async {
    print('REQUEST[${options?.method}] => PATH: ${options?.path}');
    print(options?.data);
    final token = await getIt
        .get<ss.FlutterSecureStorage>()
        .read(key: Constants.AUTH_TOKEN);
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
  Future onError(DioError err) async {
    print('ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}');
    print(err?.response?.data);
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      await _refreshToken();
      await _retry(err.request);
    }
    return super.onError(err);
  }

  Future<void> _refreshToken() async {
    final storage = getIt.get<ss.FlutterSecureStorage>();
    final token = await storage.read(key: Constants.AUTH_TOKEN);

    final refreshToken = await getIt
        .get<ss.FlutterSecureStorage>()
        .read(key: Constants.REFRESH_TOKEN);

    final request = RefreshTokenRequest(token, refreshToken);
    final response = await dio.post<DefaultResponse>(
      '/login/token/refresh',
      data: request.toJson(),
    );
    final newToken =
        response.data.success ? response.data.data : Constants.EMPTY_TOKEN;
    await storage.write(key: Constants.AUTH_TOKEN, value: newToken);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
