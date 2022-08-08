import 'package:flutter/material.dart';

class FlipPageState with ChangeNotifier {
  int _currentPageIndex = 0;

  int get getCurrentPageIndex => _currentPageIndex;

  changePageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}