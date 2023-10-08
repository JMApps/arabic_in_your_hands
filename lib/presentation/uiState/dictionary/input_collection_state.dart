import 'package:flutter/material.dart';

class InputCollectionState extends ChangeNotifier {

  bool _collectionState = false;

  bool get getCollectionState => _collectionState;

  set setCollectionState(String collection) {
    _collectionState = collection.isEmpty;
    notifyListeners();
  }
}