import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/biometric/biometric_screen.dart';
import 'package:boxting/features/events/events_screen.dart';
import 'package:boxting/features/login/login_bloc.dart';
import 'package:boxting/features/profile/profile_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final child = useState<Widget>(const EventsScreen());
    Widget getChildByIndex(int index, BuildContext context) {
      switch (index) {
        case 0:
          child.value = const EventsScreen();
          break;
        case 1:
          child.value = const ProfileScreen();
          break;
        default:
      }
      return child.value;
    }

    return BoxtingScaffold(body: child.value);

    // return ProviderListener<AsyncValue<bool>>(
    //   provider: isFirstTimeLoginProvider,
    //   onChange: (context, result) async {
    //     if (result.data.value) {
    //       await context.read(setFirstLoginProvider);
    //       await BiometricScreen.navigate(context);
    //     }
    //   },
    //   child: BoxtingScaffold(
    //     body: child.value,
    //   ),
    // );
  }
}
