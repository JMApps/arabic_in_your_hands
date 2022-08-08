import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ContentPlayerState with ChangeNotifier {
  final _player = AudioPlayer();

  AudioPlayer get getPlayer => _player;

  bool _trackLoopState = false;

  bool get getTrackLoopState => _trackLoopState;

  bool _playListLoopState = false;

  bool get getPlayListLoopState => _playListLoopState;

  int _currentTrackIndex = 0;

  int get getCurrentTrackIndex => _currentTrackIndex;

  bool _playingState = false;

  bool get getPlayingState => _playingState;

  initPlayer(AsyncSnapshot snapshot) async {
    var listAudios = List<AudioSource>.generate(
        snapshot.data!.length,
        (i) => AudioSource.uri(Uri.parse(
            'asset:///assets/audios/${snapshot.data![i].audioName}.mp3')));
    final myPlayList = ConcatenatingAudioSource(
      children: listAudios,
    );

    await _player.setAudioSource(myPlayList,
        initialIndex: _currentTrackIndex, preload: false);

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
          _currentTrackIndex = 0;
          _playingState = false;
          _player.seek(Duration.zero, index: _currentTrackIndex);
          _player.stop();
        }
        notifyListeners();
      },
    );
  }

  playOne(int index) async {
    _player.seek(Duration.zero, index: index);
    _player.play();
    notifyListeners();
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

  trackLoopState() {
    _trackLoopState = !_trackLoopState;
    if (_trackLoopState) {
      if (_playListLoopState) {
        _playListLoopState = false;
      }
    }
    _player.setLoopMode(_trackLoopState ? LoopMode.one : LoopMode.off);
    notifyListeners();
  }

  changePlayListLoopState() {
    _playListLoopState = !_playListLoopState;
    if (_playListLoopState) {
      if (_trackLoopState) {
        _trackLoopState = false;
      }
    }
    _player.setLoopMode(_playListLoopState ? LoopMode.all : LoopMode.off);
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
