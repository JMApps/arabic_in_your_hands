import 'package:flutter/material.dart';

class MainNavigationState with ChangeNotifier {
  int _currentIndex = 2;

  int get getCurrentIndex => _currentIndex;

  changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
