import 'package:flutter/material.dart';

class VolumeContentDialogVisibilityState with ChangeNotifier {

  bool _firstDialogVisibility = true;

  bool get getFirstDialogVisibility => _firstDialogVisibility;

  bool _secondDialogVisibility = true;

  bool get getSecondDialogVisibility => _secondDialogVisibility;

  updateFirstVisibilityState(bool state) {
    _firstDialogVisibility = state;
    if (!_firstDialogVisibility) {
      if (!_secondDialogVisibility) {
        _secondDialogVisibility = true;
      }
    }
    notifyListeners();
  }

  updateSecondVisibilityState(bool state) {
    _secondDialogVisibility = state;
    if (!_secondDialogVisibility) {
      if (!_firstDialogVisibility) {
        _firstDialogVisibility = true;
      }
    }
    notifyListeners();
  }
}