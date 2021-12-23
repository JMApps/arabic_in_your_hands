import 'package:arabicinyourhands/provider/content_player_state.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentPlayer extends StatefulWidget {
  const ContentPlayer({Key? key, required this.snapshot, required this.player})
      : super(key: key);

  final AsyncSnapshot snapshot;
  final AssetsAudioPlayer player;

  @override
  _ContentPlayerState createState() => _ContentPlayerState();
}

class _ContentPlayerState extends State<ContentPlayer> {
  @override
  void initState() {
    widget.player.playlistAudioFinished.listen((event) {
      // Включать и отключать последовательное воспроизведение
    });

    widget.player.playlistFinished.listen((playlistFinished) {
      if (playlistFinished) {
        // Прокрутить до начала
      }
    });
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
                    thumbColor: Colors.white,
                    trackColor: Colors.grey,
                    activeColor: const Color(0xFF1F8D6E),
                    value: context
                        .watch<VolumeContentDialogVisibilityState>()
                        .getFirstDialogVisibility,
                    onChanged: (value) {
                      context
                          .read<VolumeContentDialogVisibilityState>()
                          .updateFirstVisibilityState(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.repeat,
                    color: context.watch<ContentPlayerState>().getLoopState
                        ? Colors.red[300]
                        : Colors.white,
                  ),
                  onPressed: () {
                    context.read<ContentPlayerState>().changeLoopState();
                    widget.player.setLoopMode(
                        context.read<ContentPlayerState>().getLoopState
                            ? LoopMode.single
                            : LoopMode.none);
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
                    realTimePlayingInfo.isPlaying
                        ? CupertinoIcons.pause
                        : CupertinoIcons.play_arrow,
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
                    Icons.all_inclusive,
                    color: context.watch<ContentPlayerState>().getPlayListState
                        ? Colors.red[300]
                        : Colors.white,
                  ),
                  onPressed: () {
                    context.read<ContentPlayerState>().changePlayListState();
                    widget.player.setLoopMode(
                        context.read<ContentPlayerState>().getPlayListState
                            ? LoopMode.playlist
                            : LoopMode.none);
                  },
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    thumbColor: Colors.white,
                    trackColor: Colors.grey,
                    activeColor: const Color(0xFF1F8D6E),
                    value: context
                        .watch<VolumeContentDialogVisibilityState>()
                        .getSecondDialogVisibility,
                    onChanged: (value) {
                      context
                          .read<VolumeContentDialogVisibilityState>()
                          .updateSecondVisibilityState(value);
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
