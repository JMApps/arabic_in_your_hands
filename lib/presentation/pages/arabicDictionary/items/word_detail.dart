import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/lists/add_word_collections_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordDetail extends StatelessWidget {
  const WordDetail({
    super.key,
    required this.wordModel,
  });

  final WordEntity wordModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mainMardingHorizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      wordModel.word,
                      style: const TextStyle(
                        fontSize: 50,
                        fontFamily: 'Uthmanic',
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 8),
                    if (wordModel.plural != null)
                      Text(
                        wordModel.plural ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Uthmanic',
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                children: [
                  if (wordModel.species != null)
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: appColors.secondary,
                      child: Text(
                        wordModel.species ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ),
                  Text(
                    wordModel.root,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Uthmanic',
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
                    icon: const Icon(CupertinoIcons.add_circled, size: 40),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (wordModel.meaning != null)
            Text(
              wordModel.meaning ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w100,
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
