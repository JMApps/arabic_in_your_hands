import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/word_category_args.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/category_options.dart';
import 'package:flutter/material.dart';

class DictionaryCategoryItem extends StatelessWidget {
  const DictionaryCategoryItem({
    super.key,
    required this.model,
    required this.index,
  });

  final UserDictionaryCategoryEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Color itemColor = AppColors.priorityColor[model.priority].withOpacity(0.15);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: itemColor,
          borderRadius: AppStyles.mainBorder,
        ),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/category_words_content',
              arguments: WordCategoryArgs(model: model),
            );
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => CategoryOptions(categoryId: model.id),
            );
          },
          shape: AppStyles.mainShape,
          title: Text(
            model.wordCategoryTitle,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          trailing: CircleAvatar(
            radius: 7.5,
            backgroundColor: HexColor.fromHex(model.wordCategoryColor),
          ),
        ),
      ),
    );
  }
}
