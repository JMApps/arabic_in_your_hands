import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/presentation/uiState/player/play_speed_state.dart';
import 'package:arabicinyourhands/presentation/widgets/play_speed_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PlaySpeed extends StatelessWidget {
  const PlaySpeed({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Container(
      padding: AppStyles.mainMardingWithoutTopMini,
      child: Consumer<PlaySpeedState>(
        builder: (parentContext, playingSpeedState, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                locale.playSpeed,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: appColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              PlaySpeedRadioButton(
                title: '0.5x',
                groupIndex: 0,
                radioIndex: playingSpeedState.getPlaySpeedIndex,
                onPressed: () => playingSpeedState.playingSpeed(
                  playingSpeed: 0.5,
                  groupValue: 0,
                ),
              ),
              PlaySpeedRadioButton(
                title: '0.75x',
                groupIndex: 1,
                radioIndex: playingSpeedState.getPlaySpeedIndex,
                onPressed: () => playingSpeedState.playingSpeed(
                  playingSpeed: 0.75,
                  groupValue: 1,
                ),
              ),
              PlaySpeedRadioButton(
                title: '1x',
                groupIndex: 2,
                radioIndex: playingSpeedState.getPlaySpeedIndex,
                onPressed: () => playingSpeedState.playingSpeed(
                  playingSpeed: 1,
                  groupValue: 2,
                ),
              ),
              PlaySpeedRadioButton(
                title: '1.5x',
                groupIndex: 3,
                radioIndex: playingSpeedState.getPlaySpeedIndex,
                onPressed: () => playingSpeedState.playingSpeed(
                  playingSpeed: 1.5,
                  groupValue: 3,
                ),
              ),
              PlaySpeedRadioButton(
                title: '1.75x',
                groupIndex: 4,
                radioIndex: playingSpeedState.getPlaySpeedIndex,
                onPressed: () => playingSpeedState.playingSpeed(
                  playingSpeed: 1.75,
                  groupValue: 4,
                ),
              ),
              PlaySpeedRadioButton(
                title: '2x',
                groupIndex: 5,
                radioIndex: playingSpeedState.getPlaySpeedIndex,
                onPressed: () => playingSpeedState.playingSpeed(
                  playingSpeed: 2,
                  groupValue: 5,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
