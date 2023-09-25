import 'package:flutter/material.dart';

class MainNavigationState with ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
