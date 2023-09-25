import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:flutter/material.dart';

class FlipFrontSecondVolItem extends StatelessWidget {
  const FlipFrontSecondVolItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingHorizontal,
      child: Center(
        child: Padding(
          padding: AppStyles.mainMarding,
          child: Text(
            model.arabicContent,
            style: TextStyle(
              fontSize: 35,
              color: appColors.primary,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
