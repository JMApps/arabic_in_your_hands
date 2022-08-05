import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ContentPlayerState with ChangeNotifier {
  final _player = AudioPlayer();

  AudioPlayer get getPlayer => _player;

  bool _loopState = false;

  bool get getLoopState => _loopState;

  bool _playListState = false;

  bool get getPlayListState => _playListState;

  int _currentTrackIndex = -1;

  int get getCurrentTrackIndex => _currentTrackIndex;

  bool _playingState = false;

  bool get getPlayingState => _playingState;

  initPlayer(AsyncSnapshot snapshot) async {
    var listAudios = List<AudioSource>.generate(
        snapshot.data!.length,
        (i) => AudioSource.uri(Uri.parse(
            'asset:///assets/audios/${snapshot.data![i].audioName}.mp3')));
    final myPl = ConcatenatingAudioSource(
      children: listAudios,
    );
    await _player.setAudioSource(myPl, initialIndex: 0, preload: false);
    _player.currentIndexStream.listen(
      (index) {
        _currentTrackIndex = index!;
        notifyListeners();
      },
    );

    _player.playerStateStream.listen(
      (playerState) {
        _playingState = playerState.playing;
        if (playerState.processingState == ProcessingState.completed) {
          _currentTrackIndex = -1;
          _playingState = false;
        }
        notifyListeners();
      },
    );
  }

  previousTrack() {
    _player.seekToPrevious();
  }

  playPause() {
    _playingState ? _player.pause() : _player.play();
  }

  nextTrack() {
    _player.seekToNext();
  }

  changeLoopState() {
    _loopState = !_loopState;
    if (_loopState) {
      if (_playListState) {
        _playListState = false;
      }
      _player.setLoopMode(LoopMode.one);
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
    _player.setLoopMode(LoopMode.all);
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
