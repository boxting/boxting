import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/features/profile/edit_profile_screen.dart';
import 'package:boxting/features/profile/providers.dart';
import 'package:boxting/features/settings/settings_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(userInfoProvider);
    return BoxtingScaffold(
      appBar: BoxtingAppBar(
        isRoot: true,
        trailing: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => SettingsScreen.navigate(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: provider.when(
          loading: () => const BoxtingLoadingScreen(),
          data: (user) => ProfileScreenBody(user: user),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
  final User user;

  const ProfileScreenBody({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.person, size: 48),
          ),
        ),
        const SizedBox(height: 24),
        Text('${user.name} ${user.lastname}', style: subTitleTextStyle),
        const SizedBox(height: 48),
        ListTile(
            title: Text(user.dni), leading: const Icon(Icons.perm_identity)),
        ListTile(title: Text(user.phone), leading: const Icon(Icons.phone)),
        ListTile(title: Text(user.mail), leading: const Icon(Icons.mail)),
        ListTile(title: Text(user.birthday), leading: const Icon(Icons.cake)),
        const SizedBox(height: 48),
        BoxtingButton(
          child: const Text('Editar datos'),
          onPressed: () => EditProfileScreen.navigate(context, user),
        ),
      ],
    );
  }
}
