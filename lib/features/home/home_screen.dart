import 'package:boxting/features/biometric/biometric_bloc.dart';
import 'package:boxting/features/biometric/biometric_screen.dart';
import 'package:boxting/features/events/events_screen.dart';
import 'package:boxting/features/login/login_bloc.dart';
import 'package:boxting/features/profile/profile_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    final child = useState<Widget>(const EventsScreen());
    ref.listen(
      isFirstTimeLoginProvider,
      (prev, next) {
        if (next.requireValue) {
          ref.read(setFirstLoginProvider);
          BiometricScreen.navigate(context);
        }
      },
    );

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

    return BoxtingScaffold(
      body: child.value,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectedIndex.value = value;
          getChildByIndex(selectedIndex.value, context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote_outlined),
            label: 'Votaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          )
        ],
      ),
    );
  }
}
