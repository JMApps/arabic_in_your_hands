import 'package:flutter/cupertino.dart';

class PlaySpeedState extends ChangeNotifier {
  int _playSpeedIndex = 2;

  int get getPlaySpeedIndex => _playSpeedIndex;

  double _playSpeed = 1;

  double get getPlaySpeed => _playSpeed;

  playingSpeed({required double playingSpeed, required int groupValue}) {
    _playSpeedIndex = groupValue;
    _playSpeed = playingSpeed;
    notifyListeners();
  }
}