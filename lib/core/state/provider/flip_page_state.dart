import 'package:flutter/material.dart';

class FlipPageState with ChangeNotifier {
  int _currentFirstVolumePageIndex = 0;

  int get getCurrentFirstVolumePageIndex => _currentFirstVolumePageIndex;

  int _currentSecondVolumePageIndex = 0;

  int get getCurrentSecondVolumePageIndex => _currentSecondVolumePageIndex;

  bool _cardMode = true;

  bool get getCardMode => _cardMode;

  changeFirstVolumePageIndex(int index) {
    _currentFirstVolumePageIndex = index;
    notifyListeners();
  }

  changeSecondVolumePageIndex(int index) {
    _currentSecondVolumePageIndex = index;
    notifyListeners();
  }

  changeCardMode() {
    _cardMode = !_cardMode;
    notifyListeners();
  }
}
