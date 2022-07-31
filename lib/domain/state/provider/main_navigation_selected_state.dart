import 'package:flutter/material.dart';

class MainNavigationSelectedState with ChangeNotifier {
  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex;

  int _currentFirstSelectedItem = -1;

  int get getCurrentFirstSelectedItem => _currentFirstSelectedItem;

  int _currentSecondSelectedItem = -1;

  int get getCurrentSecondSelectedItem => _currentSecondSelectedItem;


  changeBottomNavigationIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  updateFirstSelectedState(int newIndex) {
    _currentFirstSelectedItem = newIndex;
    notifyListeners();
  }

  updateSecondSelectedState(int newIndex) {
    _currentSecondSelectedItem = newIndex;
    notifyListeners();
  }
}
