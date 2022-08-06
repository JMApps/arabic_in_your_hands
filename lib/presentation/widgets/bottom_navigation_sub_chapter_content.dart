import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_visibility.dart';
import 'package:arabicinyourhands/presentation/widgets/play_speed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationSubChapterContent extends StatelessWidget {
  const BottomNavigationSubChapterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getWatchPlayerState = context.watch<ContentPlayerState>();
    final getWithoutListen =
        Provider.of<ContentPlayerState>(context, listen: false);
    return Material(
      color: const Color(0xFF243743),
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
                color: getWatchPlayerState.getPlayListLoopState
                    ? const Color(0xFF006D50)
                    : const Color(0xFFFFFFFF),
              ),
              splashRadius: 20,
              onPressed: () {
                getWithoutListen.changePlayListLoopState();
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.backward_end,
                color: Color(0xFF37FFC2),
              ),
              splashRadius: 20,
              onPressed: () {
                getWithoutListen.previousTrack();
              },
            ),
            IconButton(
              icon: Icon(
                getWatchPlayerState.getPlayingState
                    ? CupertinoIcons.pause
                    : CupertinoIcons.play,
                color: const Color(0xFF37FFC2),
              ),
              splashRadius: 20,
              onPressed: () {
                getWithoutListen.playPause();
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.forward_end,
                color: Color(0xFF37FFC2),
              ),
              splashRadius: 20,
              onPressed: () {
                getWithoutListen.nextTrack();
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_counterclockwise,
                color: getWatchPlayerState.getTrackLoopState
                    ? const Color(0xFF006D50)
                    : const Color(0xFFFFFFFF),
              ),
              splashRadius: 20,
              onPressed: () {
                getWithoutListen.trackLoopState();
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
