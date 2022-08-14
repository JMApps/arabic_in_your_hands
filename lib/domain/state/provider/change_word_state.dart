import 'package:flutter/material.dart';

class ChangeWordState with ChangeNotifier {

  ChangeWordState(this._word, this._wordTranslation, this._wordColor) {
    _wordEditingController.text = _word;
    _wordTranslationEditingController.text = _wordTranslation;
    _wordColor = _wordColor;
  }

  final TextEditingController _wordEditingController = TextEditingController();

  TextEditingController get getWordEditingController => _wordEditingController;

  final TextEditingController _wordTranslationEditingController = TextEditingController();

  TextEditingController get getWordTranslationEditingController => _wordTranslationEditingController;

  String _word = '';

  String get getWord => _word;

  String _wordTranslation = '';

  String get getWordTranslation => _wordTranslation;

  int _wordColor = Colors.grey.value;

  int get getWordColor => _wordColor;

  onChangeWordText(String value) {
    _word = value;
    notifyListeners();
  }

  onChangeWordTranslationText(String value) {
    _wordTranslation = value;
    notifyListeners();
  }

  selectWordColor(Color wordColor) {
    _wordColor = wordColor.value;
    notifyListeners();
  }

  @override
  void dispose() {
    _wordEditingController.dispose();
    _wordTranslationEditingController.dispose();
    super.dispose();
  }
}