import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/features/profile/edit_profile_screen.dart';
import 'package:boxting/features/profile/providers.dart';
import 'package:boxting/features/settings/settings_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(userInfoProvider);
    return BoxtingScaffold(
      appBar: BoxtingAppBar(
        leading: SizedBox(),
        trailing: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => SettingsScreen.navigate(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: provider.when(
          loading: () => BoxtingLoadingScreen(),
          data: (user) => ProfileScreenBody(user: user),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
  final User user;

  const ProfileScreenBody({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.person, size: 48),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
        ),
        SizedBox(height: 24),
        Text('${user.name} ${user.lastname}', style: subTitleTextStyle),
        SizedBox(height: 48),
        ListTile(title: Text(user.dni), leading: Icon(Icons.perm_identity)),
        ListTile(title: Text(user.phone), leading: Icon(Icons.phone)),
        ListTile(title: Text(user.mail), leading: Icon(Icons.mail)),
        ListTile(title: Text(user.birthday), leading: Icon(Icons.cake)),
        SizedBox(height: 48),
        BoxtingButton(
          child: Text('Editar datos'),
          onPressed: () => EditProfileScreen.navigate(context, user),
        ),
      ],
    );
  }
}
