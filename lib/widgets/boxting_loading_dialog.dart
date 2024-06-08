import 'package:boxting/widgets/loading_vote.dart';
import 'package:boxting/widgets/navigation.dart';
import 'package:boxting/widgets/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BoxtingLoadingDialog extends StatelessWidget {
  const BoxtingLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.center,
      child: const SizedBox(child: LoadingVote()),
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required AsyncValueGetter<T> futureBuilder,
    VoidCallback? onSuccess,
    AsyncValueConverter<dynamic, T>? onError,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        futureBuilder().then(
          (value) {
            BoxtingNavigation.pop<T>(context, value);
            onSuccess?.call();
          },
          onError: (err) async {
            BoxtingNavigation.pop<T>(context);
            await onError?.call(err.message);
          },
        );
        return const BoxtingLoadingDialog();
      },
    );
  }
}
