import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/word_option.dart';
import 'package:flutter/material.dart';

class WordCollectionItem extends StatelessWidget {
  const WordCollectionItem({
    super.key,
    required this.model,
    required this.index,
  });

  final WordEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
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
            builder: (_) => WordOption(wordModel: model),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: index.isOdd ? itemOddColor : itemEvenColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        model.word,
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Uthmanic',
                          color: appColors.mainIconColor,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(width: 8),
                      Visibility(
                        visible: model.plural != null,
                        child: Text(
                          model.plural ?? '',
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Uthmanic',
                            color: Color(0xFF9E9E9E),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: model.species != null,
                        child: CircleAvatar(
                          backgroundColor:
                              appColors.secondary.withOpacity(0.50),
                          child: Text(model.species ?? ''),
                        ),
                      ),
                      Text(
                        model.root,
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
                visible: model.shortMeaning != null,
                child: Text(
                  model.shortMeaning ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
