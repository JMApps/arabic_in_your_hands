import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class WordsFlipFrontCard extends StatelessWidget {
  const WordsFlipFrontCard({
    super.key,
    required this.wordTranslate,
  });

  final String wordTranslate;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMardingHorizontal,
      child: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainMarding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                wordTranslate,
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
