import 'package:boxting/data/network/network.dart';
import 'package:boxting/data/repository/auth_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBoxtingClient extends Mock implements BoxtingClient {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late BoxtingClient _client;
  late FlutterSecureStorage _storage;
  group('AuthRepository', () {
    setUp(() {
      _client = MockBoxtingClient();
      _storage = MockFlutterSecureStorage();
    });
    test('initialize', () {
      final _auth = AuthRepositoryImpl(
        boxtingClient: _client,
        secureStorage: _storage,
      );
      expect(_auth, isNotNull);
    });
  });
}
