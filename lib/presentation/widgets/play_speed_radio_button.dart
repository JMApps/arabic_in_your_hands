import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class PlaySpeedRadioButton extends StatelessWidget {
  const PlaySpeedRadioButton({
    super.key,
    required this.title,
    required this.groupIndex,
    required this.radioIndex,
    required this.onPressed,
  });

  final String title;
  final int groupIndex;
  final int radioIndex;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return RadioListTile(
      activeColor: appColors.secondary,
      shape: AppStyles.mainShape,
      title: Text(title),
      value: groupIndex,
      groupValue: radioIndex,
      onChanged: (onChanged) {
        onPressed();
        Navigator.of(context).pop();
      },
    );
  }
}
