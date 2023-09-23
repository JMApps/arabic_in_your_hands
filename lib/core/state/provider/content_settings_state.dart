import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ContentSettingsState with ChangeNotifier {
  var mainSettingsBox = Hive.box(AppConstraints.keyMainSettingBox);

  double _arabicTextSize = 20.0;

  double get getArabicTextSize => _arabicTextSize;

  double _translationTextSize = 20.0;

  double get getTranslationTextSize => _translationTextSize;

  int _arabicFontIndex = 0;

  int get getArabicFontIndex => _arabicFontIndex;

  final List<String> _getArabicFonts = [
    'Calibri',
    'Scheherazade',
    'Lateef',
  ];

  String _arabicFontName = 'Calibri';

  String get getArabicFontName => _arabicFontName;

  int _translationFontIndex = 0;

  int get getTranslationFontIndex => _translationFontIndex;

  final List<String> _getTranslationFonts = [
    'Play',
    'Gilroy',
    'Roboto',
  ];

  String _translationFontName = 'Play';

  String get getTranslationFontName => _translationFontName;

  final List<bool> _isTextAlignSelected = [false, true, false];

  List<bool> get getIsTextAlignSelected => _isTextAlignSelected;

  TextAlign _textAlign = TextAlign.center;

  TextAlign get getTextAlign => _textAlign;

  final List<TextAlign> _getCurrentTextAlign = [
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
  ];

  int _textAlignIndex = 1;

  int get getTextAlignIndex => _textAlignIndex;

  bool _wakeLockState = true;

  bool get getWakeLockState => _wakeLockState;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get getThemeMode => _themeMode;

  bool _themeIsAdaptive = true;

  bool get getThemeIsAdaptive => _themeIsAdaptive;

  bool _themeIsUser = false;

  bool get getThemeIsUser => _themeIsUser;

  changeTextArabicSize(double size) {
    _arabicTextSize = size;
    mainSettingsBox.put(AppConstraints.keyArabicTextSize, _arabicTextSize);
    notifyListeners();
  }

  changeTextTranslationSize(double size) {
    _translationTextSize = size;
    mainSettingsBox.put(AppConstraints.keyTranslationTextSize, _translationTextSize);
    notifyListeners();
  }

  changeArabicFontIndex(int index) {
    _arabicFontIndex = index;
    _arabicFontName = _getArabicFonts[index];
    mainSettingsBox.put(AppConstraints.keyArabicFontIndex, _arabicFontIndex);
    notifyListeners();
  }

  changeTranslationFontIndex(int index) {
    _translationFontIndex = index;
    _translationFontName = _getTranslationFonts[index];
    mainSettingsBox.put(
        AppConstraints.keyTranslationFontIndex, _translationFontIndex);
    notifyListeners();
  }

  changeTextAlign(int index) {
    _textAlignIndex = index;
    for (int i = 0; i < _isTextAlignSelected.length; i++) {
      _isTextAlignSelected[i] = i == _textAlignIndex;
    }
    _textAlign = _getCurrentTextAlign[_textAlignIndex];
    mainSettingsBox.put(AppConstraints.keyTextAlignIndex, _textAlignIndex);
    notifyListeners();
  }

  changeWakeLockState(bool state) {
    _wakeLockState = state;
    mainSettingsBox.put(AppConstraints.keyDisplayWakeClock, _wakeLockState);
    notifyListeners();
  }

  changeThemeAdaptiveState(bool state) {
    _themeIsAdaptive = state;
    _themeMode = ThemeMode.system;
    mainSettingsBox.put(AppConstraints.keyThemeIsAdaptive, _themeIsAdaptive);
    notifyListeners();
  }

  changeThemeUserState(bool state) {
    if (!_themeIsAdaptive) {
      state ? ThemeMode.dark : ThemeMode.light;
      mainSettingsBox.put(AppConstraints.keyThemeIsUser, state);
      notifyListeners();
    }
  }

  initSettings() {
    _arabicTextSize = mainSettingsBox.get(AppConstraints.keyArabicTextSize, defaultValue: 18.0);
    _translationTextSize = mainSettingsBox.get(AppConstraints.keyTranslationTextSize, defaultValue: 18.0);
    _arabicFontIndex = mainSettingsBox.get(AppConstraints.keyArabicFontIndex, defaultValue: 0);
    _translationFontIndex = mainSettingsBox.get(AppConstraints.keyTranslationFontIndex, defaultValue: 0);
    _textAlignIndex = mainSettingsBox.get(AppConstraints.keyTextAlignIndex, defaultValue: 1);
    _textAlign = _getCurrentTextAlign[_textAlignIndex];
    for (int i = 0; i < _isTextAlignSelected.length; i++) {
      _isTextAlignSelected[i] = i == _textAlignIndex;
    }
    _wakeLockState = mainSettingsBox.get(AppConstraints.keyDisplayWakeClock, defaultValue: true);
    _wakeLockState ? WakelockPlus.enable() : WakelockPlus.disable();
    _themeIsAdaptive = mainSettingsBox.get(AppConstraints.keyThemeIsAdaptive, defaultValue: true);
    _themeIsUser = mainSettingsBox.get(AppConstraints.keyThemeIsUser, defaultValue: false);
    if (!_themeIsAdaptive) {
      _themeMode = _themeIsUser ? ThemeMode.dark : ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
  }
}