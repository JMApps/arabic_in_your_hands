import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/state/word_collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_in_detail.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/word_collection_options.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class WordCollectionItem extends StatelessWidget {
  const WordCollectionItem({
    super.key,
    required this.model,
    required this.wordCollectionId,
    required this.index,
  });

  final WordEntity model;
  final int wordCollectionId;
  final int index;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.mainIconColor.withOpacity(0.05);
    final Color itemEvenColor = appColors.mainIconColor.withOpacity(0.15);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) => WordInDetail(wordModel: model),
          );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => WordCollectionOptions(
              wordId: model.id,
              wordCollectionId: wordCollectionId,
            ),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: index.isOdd ? itemOddColor : itemEvenColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          model.word,
                          style: const TextStyle(
                            fontSize: 35,
                            fontFamily: 'Uthmanic',
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(width: 8),
                        if (model.plural != null)
                          Text(
                            model.plural ?? '',
                            style: const TextStyle(
                              fontSize: 25,
                              fontFamily: 'Uthmanic',
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (model.shortMeaning != null)
                      Text(
                        model.shortMeaning ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w100,
                        ),
                      )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (model.species != null)
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: appColors.secondary,
                      child: Text(
                        model.species ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ),
                  Text(
                    model.root,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Uthmanic',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: appColors.secondary,
                          duration: const Duration(milliseconds: 500),
                          content: SnackBarMessage(
                            message: locale!.wordDeleted,
                          ),
                        ),
                      );
                      Provider.of<WordCollectionState>(context, listen: false)
                          .deleteWordFromCollection(wordId: model.id);
                    },
                    icon: const Icon(CupertinoIcons.minus_circle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
