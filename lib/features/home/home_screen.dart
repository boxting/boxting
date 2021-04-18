import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/biometric/biometric_screen.dart';
import 'package:boxting/features/events/events_screen.dart';
import 'package:boxting/features/login/login_bloc.dart';
import 'package:boxting/features/profile/profile_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookWidget {
  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final child = useState<Widget>(EventsScreen());
    Widget getChildByIndex(int index, BuildContext context) {
      switch (index) {
        case 0:
          child.value = EventsScreen();
          break;
        case 1:
          child.value = ProfileScreen();
          break;
        default:
      }
      return child.value;
    }

    return ProviderListener<AsyncValue<bool>>(
      provider: isFirstTimeLoginProvider,
      onChange: (context, result) async {
        if (result.data.value) {
          await context.read(setFirstLoginProvider);
          await BiometricScreen.navigate(context);
        }
      },
      child: BoxtingScaffold(
        body: child.value,
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBackgroundColor: Theme.of(context).primaryColor,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: selectedIndex.value,
          onSelectTab: (index) {
            selectedIndex.value = index;
            getChildByIndex(selectedIndex.value, context);
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.how_to_vote,
              label: 'Votaciones',
            ),
            FFNavigationBarItem(
              iconData: Icons.person,
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
