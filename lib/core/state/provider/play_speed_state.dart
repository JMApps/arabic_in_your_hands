import 'package:flutter/material.dart';

class PlaySpeedState with ChangeNotifier {
  int _playSpeedIndex = 2;

  int get getPlaySpeedIndex => _playSpeedIndex;

  double _playSpeed = 1;

  double get getPlaySpeed => _playSpeed;

  changePlaySpeed(int index) {
    _playSpeedIndex = index;
    switch (index) {
      case 0:
        _playSpeed = 0.5;
        break;
      case 1:
        _playSpeed = 0.75;
        break;
      case 2:
        _playSpeed = 1;
        break;
      case 3:
        _playSpeed = 1.5;
        break;
      case 4:
        _playSpeed = 1.75;
        break;
      default:
        _playSpeed = 1;
    }
    notifyListeners();
  }
}
