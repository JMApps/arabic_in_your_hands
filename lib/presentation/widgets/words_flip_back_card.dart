import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class WordsFlipBackCard extends StatelessWidget {
  const WordsFlipBackCard({
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
                item.word,
                style: TextStyle(
                  fontSize: 35,
                  color: myColor.myAccentColor,
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
