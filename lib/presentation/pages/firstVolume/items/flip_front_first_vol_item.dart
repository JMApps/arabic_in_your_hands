import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:flutter/material.dart';

class FlipFrontFirstVolItem extends StatelessWidget {
  const FlipFrontFirstVolItem({
    super.key,
    required this.model,
    required this.index,
  });

  final FirstVolContentEntity model;
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
