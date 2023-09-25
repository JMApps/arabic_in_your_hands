import 'package:flutter/material.dart';

class ContentFlipState with ChangeNotifier {

  bool _cardSideMode = true;

  bool get getCardSideMode => _cardSideMode;

  changeFlipSide() {
    _cardSideMode = !_cardSideMode;
    notifyListeners();
  }
}
