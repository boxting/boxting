import 'package:boxting/data/error/error_handler.dart';
import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/data/network/response/user_response/user_response.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/domain/repository/auth_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userInfoProvider = FutureProvider<User>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  final result = await repository.getUserInformation();
  return result.data.toUser();
});

final profileEventProvider = StateNotifierProvider<ProfileEvent>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ProfileEvent(repository, ref);
});

class ProfileEvent extends StateNotifier {
  ProfileEvent(this.repository, this.ref) : super(null);

  final AuthRepository repository;
  final ProviderReference ref;

  void updateProfile(UpdateProfileRequest req) async {
    try {
      await repository.updateUserInformation(req);
      await ref.container.refresh(userInfoProvider);
    } on BoxtingException catch (e) {
      throw Exception(e.message);
    }
  }
}
