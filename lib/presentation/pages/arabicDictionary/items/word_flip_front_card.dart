import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class WordFlipFrontCard extends StatelessWidget {
  const WordFlipFrontCard({
    super.key,
    required this.word,
  });

  final String word;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMarding,
      child: Container(
        alignment: Alignment.center,
        padding: AppStyles.mainMarding,
        child: Text(
          word,
          style: const TextStyle(
            fontSize: 50,
            fontFamily: 'Uthmanic',
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
