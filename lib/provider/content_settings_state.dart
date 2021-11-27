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
}