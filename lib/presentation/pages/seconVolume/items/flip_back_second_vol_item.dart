import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:flutter/material.dart';

class FlipBackSecondVolItem extends StatelessWidget {
  const FlipBackSecondVolItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMardingHorizontal,
      child: Center(
        child: Padding(
          padding: AppStyles.mainMarding,
          child: Text(
            model.translationContent,
            style: const TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
