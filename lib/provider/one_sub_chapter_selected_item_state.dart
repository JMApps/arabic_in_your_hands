import 'package:flutter/material.dart';

class OneSubChapterSelectedItemState with ChangeNotifier {
  int _currentSelectedItem = -1;

  int get getCurrentSelectedItem => _currentSelectedItem;

  updateState(int newIndex) {
    _currentSelectedItem = newIndex;
    notifyListeners();
  }
}