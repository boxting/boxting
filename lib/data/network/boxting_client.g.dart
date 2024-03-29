// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boxting_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BoxtingClient implements BoxtingClient {
  _BoxtingClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://boxting-rest-api.herokuapp.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LoginResponse> login(loginRequest) async {
    ArgumentError.checkNotNull(loginRequest, 'loginRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/login/voter',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<RegisterResponse> register(registerRequest) async {
    ArgumentError.checkNotNull(registerRequest, 'registerRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/login/register/voter',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DniResponse> getDniInformation(dni) async {
    ArgumentError.checkNotNull(dni, 'dni');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/login/dni/$dni',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DniResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DefaultResponse> sendForgotPassword(forgotPasswordRequest) async {
    ArgumentError.checkNotNull(forgotPasswordRequest, 'forgotPasswordRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgotPasswordRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/login/forgot/password',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DefaultResponse> validatePasswordToken(validateTokenRequest) async {
    ArgumentError.checkNotNull(validateTokenRequest, 'validateTokenRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(validateTokenRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/login/validate/password-token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DefaultResponse> setNewPassword(newPasswordRequest) async {
    ArgumentError.checkNotNull(newPasswordRequest, 'newPasswordRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newPasswordRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/login/set/password',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SubscribeEventResponse> subscribeNewEvent(
      subscribeEventRequest) async {
    ArgumentError.checkNotNull(subscribeEventRequest, 'subscribeEventRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(subscribeEventRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/event/subscribe/voter',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SubscribeEventResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<EventsResponse> fetchEvents() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user/events',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EventsResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SingleEventResponse> fetchEventById(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/event/id/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SingleEventResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ElectionsResponse> fetchElectionsFromEvent(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/election/event/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ElectionsResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SingleElectionResponse> fetchElectionsById(event, election) async {
    ArgumentError.checkNotNull(event, 'event');
    ArgumentError.checkNotNull(election, 'election');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/election/$election/event/$event',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SingleElectionResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DefaultResponse> unsubscribeVoterFromEvent(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/event/$id/unsubscribe/voter',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<CandidatesResponse> fetchCandidatesByElection(election) async {
    ArgumentError.checkNotNull(election, 'election');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/candidate/election/$election',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CandidatesResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SingleCandidateResponse> fetchCandidateById(candidate, listId) async {
    ArgumentError.checkNotNull(candidate, 'candidate');
    ArgumentError.checkNotNull(listId, 'listId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/candidate/$candidate/list/$listId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SingleCandidateResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserResponse> getUserInformation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DefaultResponse> emitVote(election, emitVoteRequest) async {
    ArgumentError.checkNotNull(election, 'election');
    ArgumentError.checkNotNull(emitVoteRequest, 'emitVoteRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(emitVoteRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/election/$election/vote',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ResultResponse> getResultsByElection(election) async {
    ArgumentError.checkNotNull(election, 'election');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/election/$election/results',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResultResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<VoteResponse> getMyVoteFromElection(election) async {
    ArgumentError.checkNotNull(election, 'election');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/election/$election/vote',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VoteResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> updateProfile(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    await _dio.request<void>('/user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<DefaultResponse> refreshToken(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/login/token/refresh',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DefaultResponse.fromJson(_result.data);
    return value;
  }
}
