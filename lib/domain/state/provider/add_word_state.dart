import 'package:flutter/material.dart';

class AddWordState with ChangeNotifier {

  final TextEditingController _wordEditingController = TextEditingController();

  TextEditingController get getWordEditingController => _wordEditingController;

  final TextEditingController _wordTranslationEditingController = TextEditingController();

  TextEditingController get getWordTranslationEditingController => _wordTranslationEditingController;

  int _wordColor = Colors.grey.value;

  int get getWordColor => _wordColor;

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
