import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
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
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
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
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myColor.myAccentColor.withOpacity(0.3),
              ),
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.backward_end,
                  color: Colors.white,
                ),
                splashRadius: 20,
                onPressed: () {
                  contentPlayerWithoutListen.previousTrack();
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myColor.myAccentColor.withOpacity(0.3),
              ),
              child: IconButton(
                icon: Icon(
                  getWatchContentPlayer.getPlayingState
                      ? CupertinoIcons.pause
                      : CupertinoIcons.play,
                  color: Colors.white,
                ),
                splashRadius: 20,
                onPressed: () {
                  contentPlayerWithoutListen.playPause();
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myColor.myAccentColor.withOpacity(0.3),
              ),
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.forward_end,
                  color: Colors.white,
                ),
                splashRadius: 20,
                onPressed: () {
                  contentPlayerWithoutListen.nextTrack();
                },
              ),
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
