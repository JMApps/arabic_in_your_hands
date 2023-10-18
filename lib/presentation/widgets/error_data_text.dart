import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ErrorDataText extends StatelessWidget {
  const ErrorDataText({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.mainMarding,
      alignment: Alignment.center,
      child: SelectableText(
        error,
        style: TextStyle(
          fontSize: 18,
          color: appColors.error,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
