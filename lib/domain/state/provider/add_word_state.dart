import 'package:flutter/material.dart';

class AddWordState with ChangeNotifier {

  final TextEditingController _wordEditingController = TextEditingController();

  TextEditingController get getWordEditingController => _wordEditingController;

  final TextEditingController _wordTranslationEditingController = TextEditingController();

  TextEditingController get getWordTranslationEditingController => _wordTranslationEditingController;

  String _word = '';

  String get getWord => _word;

  String _wordTranslation = '';

  String get getWordTranslation => _wordTranslation;

  Color _wordColor = Colors.grey;

  Color get getWordColor => _wordColor;

  onWordTextChanged(String value) {
    _word = value;
    notifyListeners();
  }

  onWordTranslationTextChanged(String value) {
    _wordTranslation = value;
    notifyListeners();
  }

  selectWordColor(Color wordColor) {
    _wordColor = wordColor;
    notifyListeners();
  }

  @override
  void dispose() {
    _wordEditingController.dispose();
    _wordTranslationEditingController.dispose();
    super.dispose();
  }
}
