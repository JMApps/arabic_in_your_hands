import 'package:flutter/material.dart';

class FlipPageState with ChangeNotifier {
  int _currentPageIndex = 0;

  int get getCurrentPageIndex => _currentPageIndex;

  bool _cardMode = true;

  bool get getCardMode => _cardMode;

  changePageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  changeCardMode() {
    _cardMode = !_cardMode;
    notifyListeners();
  }
}