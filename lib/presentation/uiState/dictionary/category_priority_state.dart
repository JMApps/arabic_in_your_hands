import 'package:arabicinyourhands/core/enums/priority.dart';
import 'package:flutter/material.dart';

class CategoryProiriyState extends ChangeNotifier {

  Priorities _categoryPriority = Priorities.without;

  Priorities get categoryPriority => _categoryPriority;

  int _priorityIndex = 0;

  int get getPriorityIndex => _priorityIndex;

  set setPriorityIndex(int value) {
    _priorityIndex = value;
    _categoryPriority = Priorities.values[_priorityIndex];
    notifyListeners();
  }
}