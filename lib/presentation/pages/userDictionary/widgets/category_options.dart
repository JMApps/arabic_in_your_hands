import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_category_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/change_category_popup.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class CategoryOptions extends StatelessWidget {
  const CategoryOptions({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<UserDictionaryCategoryEntity>(
      future: Provider.of<UserDictionaryCategoryState>(context, listen: false).fetchWordCategoryById(
        categoryId: categoryId,
      ),
      builder: (BuildContext context, AsyncSnapshot<UserDictionaryCategoryEntity> snapshot) {
        if (snapshot.hasData) {
          final UserDictionaryCategoryEntity model = snapshot.data!;
          return Container(
            padding: AppStyles.mainMardingWithoutTop,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.wordCategoryTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                    color: appColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return AnimatedPadding(
                          padding: MediaQuery.of(context).viewInsets,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.decelerate,
                          child: ChangeCategoryPopup(model: model),
                        );
                      },
                    );
                  },
                  child: Text(
                    locale.changeCategory,
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: AppStyles.mainMarding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteCategoryMessage,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy',
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondary,
                                    duration: const Duration(milliseconds: 500),
                                    content: SnackBarMessage(
                                      message: locale.categoryDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<UserDictionaryCategoryState>(context, listen: false).deleteCategory(categoryId: model.id);
                              },
                              child: Text(
                                locale.delete,
                                style: TextStyle(color: appColors.error),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                locale.cancel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    locale.deleteCategory,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMarding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteAllCategoriesMessage,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy',
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondary,
                                    duration: const Duration(milliseconds: 500),
                                    content: SnackBarMessage(
                                      message: locale.categoriesDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<UserDictionaryCategoryState>(context, listen: false).deleteAllCategories();
                              },
                              child: Text(
                                locale.delete,
                                style: TextStyle(color: appColors.error),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                locale.cancel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    locale.deleteAllCategories,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(error: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
