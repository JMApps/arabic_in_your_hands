import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:flutter/material.dart';

class WordsFlipFrontCard extends StatelessWidget {
  const WordsFlipFrontCard({
    super.key,
    required this.model,
  });

  final UserDictionaryWordEntity model;

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
                model.wordTranslate,
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
