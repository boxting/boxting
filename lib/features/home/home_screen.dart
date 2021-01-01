import 'package:boxting/features/settings/settings_screen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'home_bloc.dart';

class HomeScreen extends HookWidget {
  HomeScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBloc(),
      builder: (_, __) => HomeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final child = useState<Widget>();
    Widget getChildByIndex(int index, BuildContext context) {
      switch (index) {
        case 0:
          child.value = Placeholder();
          break;
        case 1:
          child.value = Placeholder();
          break;
        case 2:
          child.value = SettingsScreen.init(context);
          break;
        default:
      }
      return child.value;
    }

    return Scaffold(
      appBar: AppBar(),
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
            iconData: Icons.calendar_today,
            label: 'Calendario',
          ),
          FFNavigationBarItem(
            iconData: Icons.info_outline,
            label: 'Información',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}
