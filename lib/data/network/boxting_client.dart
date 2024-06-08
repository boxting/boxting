import 'package:boxting/data/network/request/emit_vote_request/emit_vote_request.dart';
import 'package:boxting/data/network/request/forgot_password/forgot_password_request.dart';
import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/new_password_request/new_password_request.dart';
import 'package:boxting/data/network/request/refresh_token_request/refresh_token_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/data/network/request/validate_token_request/validate_token_request.dart';
import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/data/network/response/default_response/default_response.dart';
import 'package:boxting/data/network/response/dni_response/dni_response.dart';
import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/data/network/response/login_response/login_response.dart';
import 'package:boxting/data/network/response/register_response/register_response.dart';
import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:boxting/data/network/response/subscribe_event_response/subscribe_event_response.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/data/network/response/vote_response/vote_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'boxting_client.g.dart';

@RestApi(baseUrl: 'https://boxting-rest-api.herokuapp.com')
abstract class BoxtingClient {
  factory BoxtingClient(Dio dio, {String baseUrl}) = _BoxtingClient;

  @POST('/login/voter')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST('/login/register/voter')
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @GET('/login/dni/{dni}')
  Future<DniResponse> getDniInformation(@Path('dni') String dni);

  @POST('/login/forgot/password')
  Future<DefaultResponse> sendForgotPassword(
    @Body() ForgotPasswordRequest forgotPasswordRequest,
  );

  @POST('/login/validate/password-token')
  Future<DefaultResponse> validatePasswordToken(
    @Body() ValidateTokenRequest validateTokenRequest,
  );

  @POST('/login/set/password')
  Future<DefaultResponse> setNewPassword(
    @Body() NewPasswordRequest newPasswordRequest,
  );

  @POST('/event/subscribe/voter')
  Future<SubscribeEventResponse> subscribeNewEvent(
    @Body() SubscribeEventRequest subscribeEventRequest,
  );

  @GET('/user/events')
  Future<EventsResponse> fetchEvents();

  @GET('/event/id/{eventId}')
  Future<SingleEventResponse> fetchEventById(@Path('eventId') String id);

  @GET('/election/event/{eventId}')
  Future<ElectionsResponse> fetchElectionsFromEvent(@Path('eventId') String id);

  @GET('/election/{electionId}/event/{eventId}')
  Future<SingleElectionResponse> fetchElectionsById(
    @Path('eventId') String event,
    @Path('electionId') String election,
  );

  @DELETE('/event/{eventId}/unsubscribe/voter')
  Future<DefaultResponse> unsubscribeVoterFromEvent(@Path('eventId') String id);

  @GET('/candidate/election/{electionId}')
  Future<CandidatesResponse> fetchCandidatesByElection(
    @Path('electionId') String election,
  );

  @GET('/candidate/{candidateId}/list/{listId}')
  Future<SingleCandidateResponse> fetchCandidateById(
    @Path('candidateId') String candidate,
    @Path('listId') String listId,
  );

  @GET('/user')
  Future<UserResponse> getUserInformation();

  @POST('/election/{electionId}/vote')
  Future<DefaultResponse> emitVote(
    @Path('electionId') String election,
    @Body() EmitVoteRequest emitVoteRequest,
  );

  @GET('/election/{electionId}/results')
  Future<ResultResponse> getResultsByElection(
    @Path('electionId') String election,
  );

  @GET('/election/{electionId}/vote')
  Future<VoteResponse> getMyVoteFromElection(
    @Path('electionId') String election,
  );

  @PUT('/user')
  Future<void> updateProfile(@Body() UpdateProfileRequest request);

  @POST('/login/token/refresh')
  Future<DefaultResponse> refreshToken(@Body() RefreshTokenRequest request);
}
