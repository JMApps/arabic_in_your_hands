import 'package:arabicinyourhands/core/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaySpeed extends StatelessWidget {
  const PlaySpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getReadPlaySpeed = context.read<PlaySpeedState>();
    final getWatchPlaySpeed = context.watch<PlaySpeedState>();
    return Card(
      color: myColor.mainChapterCardColor,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          bottom: 16,
          left: 16,
        ),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              width: double.maxFinite,
              child: Text(
                AppLocalizations.of(context)!.play_speed,
                style: TextStyle(
                  fontSize: 18,
                  color: myColor.myAccentColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            RadioListTile(
              activeColor: myColor.myAccentColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('0.5x'),
              value: 0,
              groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
              onChanged: (onChanged) {
                getReadPlaySpeed.changePlaySpeed(0);
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            RadioListTile(
              activeColor: myColor.myAccentColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('0.75x'),
              value: 1,
              groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
              onChanged: (onChanged) {
                getReadPlaySpeed.changePlaySpeed(1);
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            RadioListTile(
              activeColor: myColor.myAccentColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('1x'),
              value: 2,
              groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
              onChanged: (onChanged) {
                getReadPlaySpeed.changePlaySpeed(2);
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            RadioListTile(
              activeColor: myColor.myAccentColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('1.5x'),
              value: 3,
              groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
              onChanged: (onChanged) {
                getReadPlaySpeed.changePlaySpeed(3);
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            RadioListTile(
              activeColor: myColor.myAccentColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('1.75x'),
              value: 4,
              groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
              onChanged: (onChanged) {
                getReadPlaySpeed.changePlaySpeed(4);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
