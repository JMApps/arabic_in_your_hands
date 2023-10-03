import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:flutter/material.dart';

class WordsFlipBackCard extends StatelessWidget {
  const WordsFlipBackCard({
    super.key,
    required this.model,
  });

  final UserDictionaryWordEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
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
                model.word,
                style: TextStyle(
                  fontSize: 35,
                  color: appColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
