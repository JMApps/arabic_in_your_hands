import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/lists/add_word_collections_list.dart';
import 'package:flutter/cupertino.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: wordModel.plural != null,
                      child: Text(
                        wordModel.plural ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Uthmanic',
                          color: Color(0xFF9E9E9E),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      wordModel.word,
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Uthmanic',
                        color: appColors.mainIconColor,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Visibility(
                    visible: wordModel.species != null,
                    child: CircleAvatar(
                      backgroundColor: appColors.secondary.withOpacity(0.50),
                      child: Text(wordModel.species ?? ''),
                    ),
                  ),
                  Text(
                    wordModel.root,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Uthmanic',
                      color: Color(0xFF616161),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: wordModel.shortMeaning != null,
            child: Text(
              wordModel.shortMeaning ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Gilroy',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: AppStyles.mainMarding,
                  height: 500,
                  child: AddWordCollectionsList(wordModel: wordModel),
                ),
              );
            },
            icon: const Icon(CupertinoIcons.bookmark),
          ),
        ],
      ),
    );
  }
}
