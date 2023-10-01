import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_category_arguments.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/category_options.dart';
import 'package:flutter/material.dart';

class DictionaryCategoryItem extends StatelessWidget {
  const DictionaryCategoryItem({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  final UserDictionaryCategoryEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Color itemColor =
        AppColors.priorityColor[model.priority].withOpacity(0.15);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/category_words_content',
            arguments: DictionaryCategoryArguments(
              model.id,
              model.wordCategoryTitle,
              model.wordCategoryColor,
              model.priority,
            ),
          );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => CategoryOptions(categoryId: model.id),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: itemColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model.wordCategoryTitle,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 7.5,
                backgroundColor: HexColor.fromHex(model.wordCategoryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
