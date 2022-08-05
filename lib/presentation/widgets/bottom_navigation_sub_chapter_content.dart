import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationSubChapterContent extends StatelessWidget {
  const BottomNavigationSubChapterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getReadPlayerState = context.read<ContentPlayerState>();
    final getWatchPlayerState = context.watch<ContentPlayerState>();
    return Material(
      color: const Color(0xFF243743),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                activeColor: const Color(0xFF006D50),
                value: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateFirstVisibilityState(value!);
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: Colors.white,
              ),
              splashRadius: 20,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.backward_end,
                color: Color(0xFF37FFC2),
              ),
              splashRadius: 20,
              onPressed: () {
                getReadPlayerState.previousTrack();
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
                getReadPlayerState.playPause();
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.forward_end,
                color: Color(0xFF37FFC2),
              ),
              splashRadius: 20,
              onPressed: () {
                getReadPlayerState.nextTrack();
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_counterclockwise,
                color: Colors.white,
              ),
              splashRadius: 20,
              onPressed: () {},
            ),
            Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                activeColor: const Color(0xFF006D50),
                value: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateSecondVisibilityState(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
