import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_visibility.dart';
import 'package:arabicinyourhands/presentation/widgets/play_speed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContantPlayerContainer extends StatelessWidget {
  const ContantPlayerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final contentPlayerWithoutListen = Provider.of<ContentPlayerState>(context, listen: false);
    final getWatchContentPlayer = context.watch<ContentPlayerState>();
    getWatchContentPlayer.getPlayer.setSpeed(context.watch<PlaySpeedState>().getPlaySpeed);
    return Container(
      padding: AppStyles.mainMardingMini,
      color: appColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              CupertinoIcons.eye_fill,
              color: appColors.inversePrimary,
              size: 35,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
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
                  ? appColors.inversePrimary
                  : AppColors.whiteColor,
            ),
            onPressed: () {
              contentPlayerWithoutListen.changePlayListLoopState();
            },
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.inversePrimary,
            elevation: 0,
            child: const Icon(
              CupertinoIcons.backward_end,
            ),
            onPressed: () {
              contentPlayerWithoutListen.previousTrack();
            },
          ),
          FloatingActionButton(
            backgroundColor: appColors.inversePrimary,
            elevation: 0,
            child: Icon(
              getWatchContentPlayer.getPlayingState
                  ? CupertinoIcons.pause
                  : CupertinoIcons.play,
            ),
            onPressed: () {
              contentPlayerWithoutListen.playPause();
            },
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.inversePrimary,
            elevation: 0,
            child: const Icon(
              CupertinoIcons.forward_end,
            ),
            onPressed: () {
              contentPlayerWithoutListen.nextTrack();
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.arrow_counterclockwise,
              color: getWatchContentPlayer.getTrackLoopState
                  ? appColors.inversePrimary
                  : AppColors.whiteColor,
            ),
            onPressed: () {
              contentPlayerWithoutListen.trackLoopState();
            },
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.inversePrimary,
            elevation: 0,
            child: const Icon(
              CupertinoIcons.speedometer,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const PlaySpeed();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
