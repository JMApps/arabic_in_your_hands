import 'package:flutter/material.dart';

class MainNavigationState with ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  int _currentFirstSelectedItem = -1;

  int get getCurrentFirstSelectedItem => _currentFirstSelectedItem;

  int _currentSecondSelectedItem = -1;

  int get getCurrentSecondSelectedItem => _currentSecondSelectedItem;

  int _selectedChapterId = 0;

  int get getSelectedChapterId => _selectedChapterId;

  changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  changeFirstSelectedItem(int index) {
    _currentFirstSelectedItem = index;
    notifyListeners();
  }

  changeSecondSelectedItem(int index) {
    _currentSecondSelectedItem = index;
    notifyListeners();
  }

  chapterSelectedChapterId(int chapterId) {
    _selectedChapterId = chapterId;
    notifyListeners();
  }
}
