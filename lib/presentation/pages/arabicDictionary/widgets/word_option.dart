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
        title: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              wordModel.root,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Scheherazade',
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            Text(
              wordModel.word,
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Scheherazade',
                color: appColors.secondary,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            Visibility(
              visible: wordModel.species != null,
              child: CircleAvatar(
                backgroundColor: appColors.secondary.withOpacity(0.25),
                child: Text(
                  wordModel.species ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Scheherazade',
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            wordModel.meaning ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Gilroy',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
