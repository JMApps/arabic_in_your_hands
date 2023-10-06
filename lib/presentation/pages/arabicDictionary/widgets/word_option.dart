import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:flutter/material.dart';

class WordOption extends StatelessWidget {
  const WordOption({
    super.key,
    required this.wordModel,
  });

  final WordEntity wordModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.mainMarding,
      child: ListTile(
        title: Text(
          wordModel.word,
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Scheherazade',
            color: appColors.secondary,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        subtitle: Text(wordModel.meaning ?? '', style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Gilroy'
        ),),
      ),
    );
  }
}
