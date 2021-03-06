import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

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

  bool _isScreenWakeLock = false;

  bool get getScreenWakelock => _isScreenWakeLock;

  updateTextArabicSize(int newSize) {
    _textArabicSize = newSize;
    notifyListeners();
  }

  saveTextArabicSize() async {
    //_preferences.setInt(Constants.keyArabicTextSize, _textArabicSize);
  }

  updateTextTranslationSize(int newSize) {
    _textTranslationSize = newSize;
    notifyListeners();
  }

  saveTextTranslationSize() async {
    //_preferences.setInt(Constants.keyTranslationTextSize, _textTranslationSize);
  }

  updateArabicRadioValue(int value) {
    _arabicFontRadioGroupValue = value;
    notifyListeners();
  }

  saveArabicRadioValue() async {
    //_preferences.setInt(Constants.keyArabicFontIndex, _arabicFontRadioGroupValue);
  }

  updateTranslationRadioValue(int value) {
    _translationFontRadioGroupValue = value;
    notifyListeners();
  }

  saveTranslationRadioValue() async {
    //_preferences.setInt(Constants.keyTranslationFontIndex, _translationFontRadioGroupValue);
  }

  updateToggleTextLayout(int index) {
    _toggleButtonIndex = index;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    notifyListeners();
  }

  saveToggleTextLayout() async {
    //_preferences.setInt(Constants.keyTextAlignIndex, _toggleButtonIndex);
  }

  updateScreenWakeLock(bool state) {
    _isScreenWakeLock = state;
    _isScreenWakeLock ? Wakelock.enable() : Wakelock.disable();
    notifyListeners();
  }

  saveScreenWakeLock() async {
    //_preferences.setBool(Constants.keyDisplayWakeClock, _isScreenWakeLock);
  }

  initSettings() async {
    // _textArabicSize = _preferences.getInt(Constants.keyArabicTextSize) ?? 18;
    // _textTranslationSize = _preferences.getInt(Constants.keyTranslationTextSize) ?? 18;
    // _arabicFontRadioGroupValue = _preferences.getInt(Constants.keyArabicFontIndex) ?? 0;
    // _translationFontRadioGroupValue = _preferences.getInt(Constants.keyTranslationFontIndex) ?? 0;
    // _toggleButtonIndex = _preferences.getInt(Constants.keyTextAlignIndex) ?? 1;
    // for (int i = 0; i < _isSelected.length; i++) {
    //   _isSelected[i] = i == _toggleButtonIndex;
    // }
    // _isScreenWakeLock = _preferences.getBool(Constants.keyDisplayWakeClock) ?? false;
    // _isScreenWakeLock ? Wakelock.enable() : Wakelock.disable();
  }
}
