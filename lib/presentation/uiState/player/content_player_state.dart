import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ContentPlayerState with ChangeNotifier {
  final _player = AudioPlayer();

  AudioPlayer get getPlayer => _player;

  late ConcatenatingAudioSource _audioSource;

  late List<AudioSource> _audioSources;

  bool _isPlaying = false;

  bool get getIsPlaying => _isPlaying;

  bool _oneRepeat = false;

  bool get getOneRepeat => _oneRepeat;

  bool _allRepeat = false;

  bool get getAllRepeat => _allRepeat;

  Future<void> initPlayer({required AsyncSnapshot snapshot}) async {
    _audioSources = List.generate(
        snapshot.data.length,
        (index) => AudioSource.asset(
            'assets/audios/${snapshot.data[index].audioName}.mp3'));

    _audioSource = ConcatenatingAudioSource(
      children: _audioSources,
    );

    await _player.setAudioSource(_audioSource, initialIndex: 0, initialPosition: Duration.zero);
    _player.playingStream.listen((event) {
      _isPlaying = event;
      notifyListeners();
    });

    _player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        _isPlaying = false;
        _player.stop();
        _player.seek(Duration.zero, index: 0);
        notifyListeners();
      }
    });
  }

  Future<void> playAll() async {
    if (!_isPlaying) {
      _player.play();
    } else {
      _player.pause();
    }
  }

  Future<void> playOne({required int trackIndex}) async {
    _player.seek(Duration.zero, index: trackIndex);
    if (!_isPlaying) {
      _player.play();
    } else {
      _player.pause();
    }
  }

  Future<void> repeatAll() async {
    _allRepeat = !_allRepeat;
    notifyListeners();
    if (_allRepeat) {
      if (_oneRepeat) {
        _oneRepeat = false;
      }
      await _player.setLoopMode(LoopMode.all);
    } else {
      await _player.setLoopMode(LoopMode.off);
    }
  }

  Future<void> repeatOne() async {
    _oneRepeat = !_oneRepeat;
    notifyListeners();
    if (_oneRepeat) {
      if (_allRepeat) {
        _allRepeat = false;
      }
      await _player.setLoopMode(LoopMode.one);
    } else {
      await _player.setLoopMode(LoopMode.off);
    }
  }

  playingSpeed({required double playingSpeed}) {
    _player.setSpeed(playingSpeed);
  }

  Future<void> stopDispose() async {
    _isPlaying = false;
    await _player.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
