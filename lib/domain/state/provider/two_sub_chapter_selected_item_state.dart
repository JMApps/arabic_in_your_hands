import 'package:flutter/material.dart';

class TwoSubChapterSelectedItemState with ChangeNotifier {
  int _currentSelectedItem = -1;

  int get getCurrentSelectedItem => _currentSelectedItem;

  updateState(int newIndex) {
    _currentSelectedItem = newIndex;
    notifyListeners();
  }
}