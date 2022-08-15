import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WordsFlipFrontCard extends StatelessWidget {
  const WordsFlipFrontCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DictionaryWordModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 10,
      color: myColor.flipBackColor,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.wordTranslate,
                style: const TextStyle(
                  fontSize: 35,
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