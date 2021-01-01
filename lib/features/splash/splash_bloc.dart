import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplashBloc extends ChangeNotifier {
  bool _isFirstTime;
  bool get isFirstTime => _isFirstTime;

  Future<void> isFirstTimeOpen() async {
    try {
      var box = await Hive.openBox('onboarding');
      _isFirstTime = box.get('firstTime', defaultValue: true);
    } catch (e) {
      _isFirstTime = true;
    }
  }
}
