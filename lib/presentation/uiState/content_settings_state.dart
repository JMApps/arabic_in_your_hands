import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ContentSettingsState with ChangeNotifier {
  final _contentSettingsBox = Hive.box(AppConstraints.keyMainSettingBox);

  int _arabicFontIndex = 0;

  int get getArabicFontIndex => _arabicFontIndex;

  set changeArabicFontIndex(int index) {
    _arabicFontIndex = index;
    _contentSettingsBox.put(AppConstraints.keyArabicFontIndex, index);
    notifyListeners();
  }

  int _fontIndex = 0;

  int get getTranslationFontIndex => _fontIndex;

  set changeFontIndex(int index) {
    _fontIndex = index;
    _contentSettingsBox.put(AppConstraints.keyTranslationFontIndex, index);
    notifyListeners();
  }

  int _textAlignIndex = 1;

  int get getTextAlignIndex => _textAlignIndex;

  set changeTextAlignIndex(int index) {
    _textAlignIndex = index;
    _contentSettingsBox.put(AppConstraints.keyTextAlignIndex, index);
    notifyListeners();
  }

  double _arabicTextSize = 25.0;

  double get getArabicTextSize => _arabicTextSize;

  set changeArabicTextSize(double size) {
    _arabicTextSize = size;
    _contentSettingsBox.put(AppConstraints.keyArabicTextSize, size);
    notifyListeners();
  }

  double _textSize = 18.0;

  double get getTranslationTextSize => _textSize;

  set changeTextSize(double size) {
    _textSize = size;
    _contentSettingsBox.put(AppConstraints.keyTranslationTextSize, size);
    notifyListeners();
  }

  bool _adaptiveTheme = true;

  bool get getAdaptiveTheme => _adaptiveTheme;

  set changeAdaptiveTheme(bool onChanged) {
    _adaptiveTheme = onChanged;
    _contentSettingsBox.put(AppConstraints.keyThemeIsAdaptive, onChanged);
    notifyListeners();
  }

  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set changeDarkTheme(bool onChanged) {
    _darkTheme = onChanged;
    _contentSettingsBox.put(AppConstraints.keyThemeIsUser, onChanged);
    _darkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool _wakeLock = true;

  bool get getWakeLock => _wakeLock;

  set changeWakeLock(bool onChanged) {
    _wakeLock = onChanged;
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
    _contentSettingsBox.put(AppConstraints.keyDisplayWakeClock, onChanged);
    notifyListeners();
  }

  ContentSettingsState() {
    _arabicFontIndex = _contentSettingsBox.get(AppConstraints.keyArabicFontIndex, defaultValue: 0);
    _fontIndex = _contentSettingsBox.get(AppConstraints.keyTranslationFontIndex, defaultValue: 0);
    _textAlignIndex = _contentSettingsBox.get(AppConstraints.keyTextAlignIndex, defaultValue: 1);
    _arabicTextSize = _contentSettingsBox.get(AppConstraints.keyArabicTextSize, defaultValue: 25.0);
    _textSize = _contentSettingsBox.get(AppConstraints.keyTranslationTextSize, defaultValue: 18.0);
    _adaptiveTheme = _contentSettingsBox.get(AppConstraints.keyThemeIsAdaptive, defaultValue: true);
    _darkTheme = _contentSettingsBox.get(AppConstraints.keyThemeIsUser, defaultValue: false);
    _wakeLock = _contentSettingsBox.get(AppConstraints.keyDisplayWakeClock, defaultValue: true);
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
  }
}
