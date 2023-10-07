import 'package:flutter/material.dart';

class InputCollectionState extends ChangeNotifier {

  bool _categoryState = false;

  bool get getCategoryState => _categoryState;

  set setCategoryState(String category) {
    _categoryState = category.isEmpty;
    notifyListeners();
  }
}