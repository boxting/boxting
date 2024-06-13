import 'package:boxting/service_locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cancel_authentication.g.dart';

@riverpod
void cancelAuthentication(CancelAuthenticationRef ref) async {
  final _auth = ref.read(localAuthenticationProvider);
  await _auth.stopAuthentication();
}
