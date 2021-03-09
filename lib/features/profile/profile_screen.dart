import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/features/profile/profile_bloc.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class ProfileScreen extends StatelessWidget {
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ProfileBloc>()..getUserInformation(),
      builder: (_, __) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ProfileBloc>();
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: bloc.user != null
            ? ProfileScreenBody(user: bloc.user)
            : BoxtingLoadingScreen(),
      ),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
  final User user;

  const ProfileScreenBody({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(user.name),
          Text(user.phone),
          Text(user.dni),
          Text(user.mail)
        ],
      ),
    );
  }
}
