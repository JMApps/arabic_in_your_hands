import 'package:flutter/material.dart';

class ContentSettingsState with ChangeNotifier {
  int _textArabicSize = 18;

  int get getTextArabicSize => _textArabicSize;

  int _textTranslationSize = 18;

  int get getTextTranslationSize => _textTranslationSize;

  int _arabicFontRadioGroupValue = 0;

  int get getArabicFontRadioGroupValue => _arabicFontRadioGroupValue;

  int _translationFontRadioGroupValue = 0;

  int get getTranslationFontRadioGroupValue => _translationFontRadioGroupValue;

  final List<bool> _isSelected = [false, true, false];

  int _toggleButtonIndex = 1;

  int get getToggleButtonIndex => _toggleButtonIndex;

  List<bool> get getIsSelected => _isSelected;

  updateTextArabicSize(int newSize) {
    _textArabicSize = newSize;
    notifyListeners();
  }

  updateTextTranslationSize(int newSize) {
    _textTranslationSize = newSize;
    notifyListeners();
  }

  updateArabicRadioValue(int value) {
    _arabicFontRadioGroupValue = value;
    notifyListeners();
  }

  updateTranslationRadioValue(int value) {
    _translationFontRadioGroupValue = value;
    notifyListeners();
  }

  updateToggleTextLayout(int index) {
    _toggleButtonIndex = index;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    notifyListeners();
  }
}
