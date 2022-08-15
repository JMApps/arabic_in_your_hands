import 'package:flutter/material.dart';

class ChangeCategoryState with ChangeNotifier {

  ChangeCategoryState(this._categoryTitle, this._categoryColor, this._prioritySelectedIndex) {
    _textEditingController.text = _categoryTitle;
    _categoryColor = _categoryColor;
    for (int i = 0; i < getIsPrioritySelected.length; i++) {
      getIsPrioritySelected[i] = i == _prioritySelectedIndex;
    }
  }

  final TextEditingController _textEditingController = TextEditingController();

  TextEditingController get getTextEditingController => _textEditingController;

  String _categoryTitle = '';

  String get getCategoryTitle => _categoryTitle;

  Color _categoryColor = Colors.grey;

  Color get getCategoryColor => _categoryColor;

  final List<bool> _isPrioritySelected = [true, false, false, false];

  List<bool> get getIsPrioritySelected => _isPrioritySelected;

  int _prioritySelectedIndex = 0;

  int get getPrioritySelectedIndex => _prioritySelectedIndex;

  onCategoryTextChanged(String value) {
    _categoryTitle = value;
    notifyListeners();
  }

  selectCategoryColor(Color categoryColor) {
    _categoryColor = categoryColor;
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