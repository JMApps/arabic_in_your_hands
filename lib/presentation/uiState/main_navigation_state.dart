import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainNavigationState with ChangeNotifier {

  final _contentSettingsBox = Hive.box(AppConstraints.keyMainSettingBox);

  late bool isDictionaryRun;

  late int _currentIndex;

  MainNavigationState() {
    isDictionaryRun = _contentSettingsBox.get(AppConstraints.keyIsRunDictionary, defaultValue: true);
    if (isDictionaryRun) {
      _currentIndex = 2;
    } else {
      _currentIndex = 0;
    }
  }

  int get getCurrentIndex => _currentIndex;

  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
