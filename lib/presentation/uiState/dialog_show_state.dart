import 'package:flutter/material.dart';

class DialogShowState extends ChangeNotifier {
  bool _dialogArabicIsShow = true;

  bool get getDialogArabicIsShow => _dialogArabicIsShow;

  bool _dialogTranslationIsShow = true;

  bool get getDialogTranslationIsShow => _dialogTranslationIsShow;

  changeArabicShowing() {
    _dialogArabicIsShow = !_dialogArabicIsShow;
    if (!_dialogArabicIsShow) {
      if (!_dialogTranslationIsShow) {
        _dialogTranslationIsShow = true;
      }
    }
    notifyListeners();
  }

  changeTranslationShowing() {
    _dialogTranslationIsShow = !_dialogTranslationIsShow;
    if (!_dialogTranslationIsShow) {
      if (!_dialogArabicIsShow) {
        _dialogArabicIsShow = true;
      }
    }
    notifyListeners();
  }
}
