import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_visibility.dart';
import 'package:arabicinyourhands/presentation/widgets/play_speed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationSubChapterContent extends StatelessWidget {
  const BottomNavigationSubChapterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final contentPlayerWithoutListen = Provider.of<ContentPlayerState>(context, listen: false);
    final getWatchContentPlayer = context.watch<ContentPlayerState>();
    getWatchContentPlayer.getPlayer.setSpeed(context.watch<PlaySpeedState>().getPlaySpeed);
    return Material(
      color: myColor.bottomNavigationBarColor,
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                CupertinoIcons.eye,
                color: Colors.red[200],
              ),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogVisibility();
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: getWatchContentPlayer.getPlayListLoopState
                    ? myColor.myAccentColor
                    : const Color(0xFFFFFFFF),
              ),
              splashRadius: 20,
              onPressed: () {
                contentPlayerWithoutListen.changePlayListLoopState();
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.backward_end,
                  color: myColor.myAccentColor),
              splashRadius: 20,
              onPressed: () {
                contentPlayerWithoutListen.previousTrack();
              },
            ),
            IconButton(
              icon: Icon(
                  getWatchContentPlayer.getPlayingState
                      ? CupertinoIcons.pause
                      : CupertinoIcons.play,
                  color: myColor.myAccentColor),
              splashRadius: 20,
              onPressed: () {
                contentPlayerWithoutListen.playPause();
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.forward_end,
                  color: myColor.myAccentColor),
              splashRadius: 20,
              onPressed: () {
                contentPlayerWithoutListen.nextTrack();
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_counterclockwise,
                color: getWatchContentPlayer.getTrackLoopState
                    ? myColor.myAccentColor
                    : const Color(0xFFFFFFFF),
              ),
              splashRadius: 20,
              onPressed: () {
                contentPlayerWithoutListen.trackLoopState();
              },
            ),
            IconButton(
              splashRadius: 20,
              icon: const Icon(
                CupertinoIcons.speedometer,
                color: Colors.white,
              ),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return const PlaySpeed();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
