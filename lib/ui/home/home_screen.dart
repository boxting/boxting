import 'package:boxting/ui/home/home_bloc.dart';
import 'package:boxting/ui/settings/settings_screen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBloc(),
      builder: (_, __) => HomeScreen._(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  Widget child;
  Widget getChildByIndex(int index) {
    switch (index) {
      case 0:
        child = Placeholder();
        break;
      case 1:
        child = Placeholder();
        break;
      case 2:
        child = SettingsScreen.init(context);
        break;
      default:
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: Theme.of(context).primaryColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            getChildByIndex(selectedIndex);
          });
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
