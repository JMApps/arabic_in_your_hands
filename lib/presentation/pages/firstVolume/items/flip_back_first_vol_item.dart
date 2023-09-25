import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:flutter/material.dart';

class FlipBackFirstVolItem extends StatelessWidget {
  const FlipBackFirstVolItem({
    super.key,
    required this.model,
    required this.index,
  });

  final FirstVolContentEntity model;
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
