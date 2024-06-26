import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/data/repository/repository.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userInfoProvider = FutureProvider<User>((ref) async {
  final repository = ref.read(authRepositoryProvider);
  final result = await repository.getUserInformation();
  return result.data.toUser();
});

final profileEventProvider = StateNotifierProvider<ProfileEvent, dynamic>(
  (ref) {
    final repository = ref.read(authRepositoryProvider);
    return ProfileEvent(repository, () {
      ref.container.refresh(userInfoProvider);
    });
  },
);

class ProfileEvent extends StateNotifier {
  ProfileEvent(this.repository, this.callback) : super(null);

  final AuthRepository repository;
  final Function callback;

  Future<void> updateProfile(UpdateProfileRequest req) async {
    try {
      await repository.updateUserInformation(req);
      callback.call();
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
