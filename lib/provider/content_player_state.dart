import 'package:flutter/material.dart';

class ContentPlayerState with ChangeNotifier {
  bool _loopState = false;

  bool get getLoopState => _loopState;

  bool _playListState = false;

  bool get getPlayListState => _playListState;

  changeLoopState() {
    _loopState = !_loopState;
    if (_loopState) {
      if (_playListState) {
        _playListState = false;
      }
    }
    notifyListeners();
  }

  changePlayListState() {
    _playListState = !_playListState;
    if (_playListState) {
      if (_loopState) {
        _loopState = false;
      }
    }
    notifyListeners();
  }
}
