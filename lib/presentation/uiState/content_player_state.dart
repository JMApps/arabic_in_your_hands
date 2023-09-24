import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ContentPlayerState with ChangeNotifier {
  final _player = AudioPlayer();

  AudioPlayer get getPlayer => _player;

  int _playSpeedIndex = 2;

  int get getPlaySpeedIndex => _playSpeedIndex;

  playingSpeed({required double playingSpeed, required int groupValue}) {
    _playSpeedIndex = groupValue;
    _player.setSpeed(playingSpeed);
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
