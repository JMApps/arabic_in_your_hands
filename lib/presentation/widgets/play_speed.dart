import 'package:arabicinyourhands/core/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
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
    final getReadPlaySpeed = context.read<PlaySpeedState>();
    final getWatchPlaySpeed = context.watch<PlaySpeedState>();
    return Container(
      padding: AppStyles.mainMarding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale.play_speed,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: appColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          PlaySpeedRadioButton(
            title: '0.5x',
            groupIndex: 0,
            radioIndex: getWatchPlaySpeed.getPlaySpeedIndex,
            onPressed: () => getReadPlaySpeed.changePlaySpeed(0),
          ),
          PlaySpeedRadioButton(
            title: '0.75x',
            groupIndex: 1,
            radioIndex: getWatchPlaySpeed.getPlaySpeedIndex,
            onPressed: () => getReadPlaySpeed.changePlaySpeed(1),
          ),
          PlaySpeedRadioButton(
            title: '1x',
            groupIndex: 2,
            radioIndex: getWatchPlaySpeed.getPlaySpeedIndex,
            onPressed: () => getReadPlaySpeed.changePlaySpeed(2),
          ),
          PlaySpeedRadioButton(
            title: '1.5x',
            groupIndex: 3,
            radioIndex: getWatchPlaySpeed.getPlaySpeedIndex,
            onPressed: () => getReadPlaySpeed.changePlaySpeed(3),
          ),
          PlaySpeedRadioButton(
            title: '1.75x',
            groupIndex: 4,
            radioIndex: getWatchPlaySpeed.getPlaySpeedIndex,
            onPressed: () => getReadPlaySpeed.changePlaySpeed(4),
          ),
          PlaySpeedRadioButton(
            title: '2x',
            groupIndex: 5,
            radioIndex: getWatchPlaySpeed.getPlaySpeedIndex,
            onPressed: () => getReadPlaySpeed.changePlaySpeed(5),
          ),
        ],
      ),
    );
  }
}
