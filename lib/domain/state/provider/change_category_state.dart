import 'package:flutter/material.dart';

class ChangeCategoryState with ChangeNotifier {

  ChangeCategoryState(this._wordCategoryTitle, this._categoryColor, this._prioritySelectedIndex) {
    _textEditingController.text = _wordCategoryTitle;
    _categoryColor = _categoryColor;
    for (int i = 0; i < getIsPrioritySelected.length; i++) {
      getIsPrioritySelected[i] = i == _prioritySelectedIndex;
    }
  }

  final TextEditingController _textEditingController = TextEditingController();

  TextEditingController get getTextEditingController => _textEditingController;

  String _wordCategoryTitle = '';

  String get getWordCategoryTitle => _wordCategoryTitle;

  int _categoryColor = Colors.grey.value;

  int get getCategoryColor => _categoryColor;

  final List<bool> _isPrioritySelected = [true, false, false, false];

  List<bool> get getIsPrioritySelected => _isPrioritySelected;

  int _prioritySelectedIndex = 0;

  int get getPrioritySelectedIndex => _prioritySelectedIndex;

  onChangeCurrentText(String value) {
    _wordCategoryTitle = value;
    notifyListeners();
  }

  selectCategoryColor(Color categoryColor) {
    _categoryColor = categoryColor.value;
    notifyListeners();
  }

  selectTogglePriority(int index) {
    _prioritySelectedIndex = index;
    for (int i = 0; i < getIsPrioritySelected.length; i++) {
      getIsPrioritySelected[i] = i == _prioritySelectedIndex;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}