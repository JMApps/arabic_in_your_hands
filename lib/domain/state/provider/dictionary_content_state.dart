import 'package:flutter/material.dart';

class DictionaryContentState with ChangeNotifier {
  TextEditingController _textEditingController = TextEditingController();

  TextEditingController get getTextEditingController => _textEditingController;

  Color _categoryColor = Colors.grey.shade300;

  Color get getCategoryColor => _categoryColor;

  final List<bool> _isPrioritySelected = [true, false, false, false];

  List<bool> get getIsPrioritySelected => _isPrioritySelected;

  int _prioritySelectedIndex = 0;

  selectCategoryColor(Color categoryColor) {
    _categoryColor = categoryColor;
    notifyListeners();
  }

  selectTogglePriority(int index) {
    _prioritySelectedIndex = index;
    _prioritySelectedIndex == 0;
    for (int i = 0; i < getIsPrioritySelected.length; i++) {
      getIsPrioritySelected[i] = i == _prioritySelectedIndex;
    }
    notifyListeners();
  }
}