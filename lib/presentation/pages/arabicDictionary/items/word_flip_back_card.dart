import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class WordFlipBackCard extends StatelessWidget {
  const WordFlipBackCard({
    super.key,
    required this.shortMeaning,
  });

  final String shortMeaning;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMarding,
      child: Center(
        child: Text(
          shortMeaning,
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}
