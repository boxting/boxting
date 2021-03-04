import 'package:boxting/features/profile/profile_bloc.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class ProfileScreen extends StatelessWidget {
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ProfileBloc>(),
      builder: (_, __) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
