import 'package:boxting/features/feed/feed_bloc.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class FeedScreen extends HookWidget {
  FeedScreen._();
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FeedBloc(),
      builder: (_, __) => FeedScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Container(),
    );
  }
}
