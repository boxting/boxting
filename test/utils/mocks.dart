import 'package:boxting/data/network/request/login_request/login_request.dart';
import 'package:boxting/data/network/request/register_request/register_request.dart';
import 'package:boxting/data/network/request/subscribe_event_request/subscribe_event_request.dart';
import 'package:mockito/mockito.dart';

class MockLoginRequest extends Mock implements LoginRequest {}

class MockRegisterRequest extends Mock implements RegisterRequest {}

class MockSubscribeEventRequest extends Mock implements SubscribeEventRequest {}
