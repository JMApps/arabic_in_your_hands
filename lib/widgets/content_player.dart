import 'package:arabicinyourhands/provider/content_player_state.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentPlayer extends StatefulWidget {
  const ContentPlayer({Key? key, required this.snapshot, required this.player}) : super(key: key);

  final AsyncSnapshot snapshot;
  final AssetsAudioPlayer player;

  @override
  _ContentPlayerState createState() => _ContentPlayerState();
}

class _ContentPlayerState extends State<ContentPlayer> {

  bool _loopState = false;
  bool _playListState = false;

  @override
  void initState() {
    // widget.player.playlistAudioFinished.listen((event) {
    //   context.read<MainPlayerState>().setCurrentIndex(widget.player.readingPlaylist!.currentIndex);
    //   context.read<MainPlayerState>().toIndex(widget.player.readingPlaylist!.currentIndex);
    // });
    // widget.player.playlistFinished.listen((playlistFinished) {
    //   if (playlistFinished) {
    //     context.read<MainPlayerState>().toIndex(0);
    //     context.read<MainPlayerState>().setCurrentIndex(-1);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.player.builderRealtimePlayingInfos(
      builder: (BuildContext context, realTimePlayingInfo) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: const Color(0xFF1F8D6E),
                    value: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                    onChanged: (value) {
                      context.read<VolumeContentDialogVisibilityState>().updateFirstVisibilityState(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_2_squarepath,
                    color: context.watch<ContentPlayerState>().getLoopState ? Colors.red[300] : Colors.white,
                  ),
                  onPressed: () {
                    context.read<ContentPlayerState>().changeLoopState(_loopState = !_loopState);
                    widget.player.setLoopMode(context.watch<ContentPlayerState>().getLoopState ? LoopMode.single : LoopMode.none);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_turn_up_left,
                    color: Color(0xFF37FFC2),
                  ),
                  onPressed: () {
                    widget.player.previous();
                  },
                ),
                IconButton(
                  icon: Icon(
                    realTimePlayingInfo.isPlaying ? CupertinoIcons.pause_solid : CupertinoIcons.play_arrow,
                    size: 35,
                    color: const Color(0xFF37FFC2),
                  ),
                  onPressed: () {
                    widget.player.playOrPause();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_turn_up_right,
                    color: Color(0xFF37FFC2),
                  ),
                  onPressed: () {
                    widget.player.next(stopIfLast: true);
                  },
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_3_trianglepath,
                    color: context.watch<ContentPlayerState>().getPlayListState ? Colors.red[300] : Colors.white,
                  ),
                  onPressed: () {
                    context.read<ContentPlayerState>().changePlayListState(_playListState = !_playListState);
                  },
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: const Color(0xFF1F8D6E),
                    value: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                    onChanged: (value) {
                      context.read<VolumeContentDialogVisibilityState>().updateSecondVisibilityState(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
