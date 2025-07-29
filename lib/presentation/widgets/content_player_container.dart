import 'dart:io';

import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/uiState/player/content_player_state.dart';
import 'package:arabicinyourhands/presentation/uiState/player/play_speed_state.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_visibility.dart';
import 'package:arabicinyourhands/presentation/widgets/play_speed.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class ContentPlayerContaier extends StatelessWidget {
  const ContentPlayerContaier({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<List<dynamic>> snapshot;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final ContentPlayerState playerState = Provider.of<ContentPlayerState>(context);
    final AppLocalizations? locale = AppLocalizations.of(context);
    final PlaySpeedState playSpeedState = Provider.of<PlaySpeedState>(context);
    playerState.playingSpeed(playingSpeed: playSpeedState.getPlaySpeed);
    return Container(
      padding: AppStyles.mainMardingMini,
      color: appColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 8 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.small(
              backgroundColor: appColors.secondary,
              elevation: 0,
              heroTag: 'media_0',
              child: const Icon(CupertinoIcons.eye_fill),
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
                color: playerState.getAllRepeat ? appColors.error : Colors.white,
              ),
              onPressed: () {
                if (!playerState.getAllRepeat) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: appColors.secondary,
                      duration: const Duration(milliseconds: 500),
                      content: SnackBarMessage(
                        message: locale!.allRepet,
                      ),
                    ),
                  );
                }
                playerState.repeatAll();
              },
            ),
            FloatingActionButton.small(
              backgroundColor: appColors.secondary,
              elevation: 0,
              heroTag: 'media_1',
              child: const Icon(
                CupertinoIcons.backward_end,
              ),
              onPressed: () {
                playerState.getPlayer.seekToPrevious();
              },
            ),
            FloatingActionButton.small(
              backgroundColor: appColors.secondary,
              elevation: 0,
              heroTag: 'media_2',
              child: Icon(playerState.getIsPlaying
                  ? CupertinoIcons.pause
                  : CupertinoIcons.play),
              onPressed: () {
                playerState.playAll();
              },
            ),
            FloatingActionButton.small(
              backgroundColor: appColors.secondary,
              elevation: 0,
              heroTag: 'media_3',
              child: const Icon(
                CupertinoIcons.forward_end,
              ),
              onPressed: () {
                playerState.getPlayer.seekToNext();
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.arrow_counterclockwise,
                color: playerState.getOneRepeat ? appColors.error : Colors.white,
              ),
              onPressed: () {
                if (!playerState.getOneRepeat) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: appColors.secondary,
                      duration: const Duration(milliseconds: 500),
                      content: SnackBarMessage(
                        message: locale!.oneRepet,
                      ),
                    ),
                  );
                }
                playerState.repeatOne();
              },
            ),
            FloatingActionButton.small(
              backgroundColor: appColors.secondary,
              elevation: 0,
              heroTag: 'media_4',
              child: const Icon(
                CupertinoIcons.speedometer,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const SingleChildScrollView(
                      child: PlaySpeed(),
                    );
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
