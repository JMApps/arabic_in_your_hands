import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/word_options.dart';
import 'package:flutter/material.dart';

class DictionaryWordItem extends StatelessWidget {
  const DictionaryWordItem({
    Key? key,
    required this.model,
    required this.categoryId,
  }) : super(key: key);

  final UserDictionaryWordEntity model;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        shape: AppStyles.mainShape,
        title: Text(
          model.word,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          model.wordTranslate,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        trailing: CircleAvatar(
          backgroundColor: HexColor.fromHex(model.wordItemColor),
          radius: 5,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => WordOptions(
              categoryId: categoryId,
              wordId: model.id,
            ),
          );
        },
      ),
    );
  }
}
