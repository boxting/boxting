import 'package:boxting/features/events/events_screen.dart';
import 'package:boxting/features/feed/feed_screen.dart';
import 'package:boxting/features/profile/profile_screen.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.replace(context, (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(1);
    final child = useState<Widget>(EventsScreen());
    Widget getChildByIndex(int index, BuildContext context) {
      switch (index) {
        case 0:
          child.value = FeedScreen.init(context);
          break;
        case 1:
          child.value = EventsScreen();
          break;
        case 2:
          child.value = ProfileScreen();
          break;
        default:
      }
      return child.value;
    }

    return BoxtingScaffold(
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
            iconData: Icons.rss_feed_outlined,
            label: 'Información',
          ),
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
    );
  }
}
