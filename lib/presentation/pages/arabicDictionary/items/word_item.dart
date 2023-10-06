import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/word_option.dart';
import 'package:flutter/material.dart';

class WordItem extends StatelessWidget {
  const WordItem({
    super.key,
    required this.model,
  });

  final WordEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => WordOption(wordModel: model),
          );
        },
        shape: AppStyles.mainShape,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        title: Wrap(
          children: [
            Text(
              model.word,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Scheherazade',
                color: appColors.error,
              ),
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: model.plural != null,
              child: Text(
                'мн. ${model.plural}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        subtitle: Visibility(
          visible: model.shortMeaning != null,
          child: Text(
            model.shortMeaning ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        trailing: Visibility(
          visible: model.species != null,
          child: CircleAvatar(
            backgroundColor: appColors.secondary.withOpacity(0.25),
            child: Text(
              model.species ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
