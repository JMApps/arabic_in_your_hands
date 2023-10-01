import 'package:arabicinyourhands/core/enums/priority.dart';
import 'package:flutter/material.dart';

class CategoryProiriyState extends ChangeNotifier {

  late Priorities _categoryPriority;

  Priorities get categoryPriority => _categoryPriority;

  late int? _priorityIndex;

  int get getPriorityIndex => _priorityIndex!;

  late Color? _categoryColor;

  Color get getCategoryColor => _categoryColor!;

  CategoryProiriyState([this._priorityIndex = 0, this._categoryColor = Colors.grey]) {
    _categoryPriority = Priorities.values[_priorityIndex!];
  }

  set setCategoryColor(Color value) {
    _categoryColor = value;
    notifyListeners();
  }

  set setPriorityIndex(int value) {
    _priorityIndex = value;
    _categoryPriority = Priorities.values[_priorityIndex!];
    notifyListeners();
  }
}