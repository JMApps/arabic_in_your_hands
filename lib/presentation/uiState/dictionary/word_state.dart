import 'package:flutter/material.dart';

class WordState extends ChangeNotifier {

  late Color? _wordColor;

  Color get getWordColor => _wordColor!;

  bool _wordState = false;

  bool get getWordState => _wordState;

  bool _wordTranslateState = false;

  bool get getWordTranslateState => _wordTranslateState;

  WordState([this._wordColor = Colors.grey]);

  set setWordColor(Color value) {
    _wordColor = value;
    notifyListeners();
  }

  set setWordState(String word) {
    _wordState = word.isEmpty;
    notifyListeners();
  }

  set setWordTranslateState(String word) {
    _wordTranslateState = word.isEmpty;
    notifyListeners();
  }
}