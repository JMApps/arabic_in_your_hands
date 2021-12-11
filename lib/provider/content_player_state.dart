import 'package:flutter/material.dart';

class ContentPlayerState with ChangeNotifier {
  bool _loopState = false;

  bool get getLoopState => _loopState;

  bool _playListState = false;

  bool get getPlayListState => _playListState;

  changeLoopState(bool state) {
    _loopState = state;
    if (_loopState) {
      if (_playListState) {
        _playListState = false;
      }
    }
    notifyListeners();
  }

  changePlayListState(bool state) {
    if (state) {
      if (_loopState) {
        _loopState = false;
      }
    }
    _playListState = state;
    notifyListeners();
  }
}
