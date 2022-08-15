import 'package:flutter/cupertino.dart';

class WordsFlipPageState with ChangeNotifier {
  int _currentWordsFlipPageIndex = 0;

  int get getCurrentWordsFlipPageIndex => _currentWordsFlipPageIndex;

  bool _cardMode = false;

  bool get getCardMode => _cardMode;

  changePageIndex(int index) {
    _currentWordsFlipPageIndex = index;
    notifyListeners();
  }

  changeCardMode() {
    _cardMode = !_cardMode;
    notifyListeners();
  }
}