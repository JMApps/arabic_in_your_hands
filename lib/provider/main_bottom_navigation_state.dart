import 'package:flutter/material.dart';

class MainBottomNavigationState with ChangeNotifier {
  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex;

  changeBottomNavigationIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}