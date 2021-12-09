import 'package:flutter/material.dart';

class ContentPlayerState with ChangeNotifier {
  bool _loopState = false;

  bool get getLoopState => _loopState;

  bool _playListState = false;

  bool get getPlayListState => _playListState;

  changeLoopState(bool state) {
    _loopState = state;
    notifyListeners();
  }

  changePlayListState(bool state) {
    _playListState = state;
    notifyListeners();
  }
}
