import 'package:flutter/material.dart';

class MainNavigationState with ChangeNotifier {
  int _currentIndex = 2;

  int get getCurrentIndex => _currentIndex;

  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
