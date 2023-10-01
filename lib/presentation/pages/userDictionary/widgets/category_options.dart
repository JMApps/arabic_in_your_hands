import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_category_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_categories_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/change_category_popup.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryOptions extends StatefulWidget {
  const CategoryOptions({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  State<CategoryOptions> createState() => _CategoryOptionsState();
}

class _CategoryOptionsState extends State<CategoryOptions> {
  late final UserDictionaryCategoriesUseCase _categoriesUseCase;

  @override
  void initState() {
    _categoriesUseCase = UserDictionaryCategoriesUseCase(UserDictionaryCategoryDataRepository.getInstance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<UserDictionaryCategoryEntity>>(
      future: _categoriesUseCase.fetchWordCategoryById(
        categoryId: widget.categoryId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryCategoryEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final UserDictionaryCategoryEntity model = snapshot.data![0];
          return Container(
            padding: AppStyles.mainMarding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  locale.change,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: AnimatedPadding(
                            padding: MediaQuery.of(context).viewInsets,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.decelerate,
                            child: ChangeCategoryPopup(model: model),
                          ),
                        );
                      },
                    );
                  },
                  shape: AppStyles.mainShape,
                  title: Text(locale.change),
                ),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.dictionary_category_delete_message,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                _categoriesUseCase.deleteCategory(categoryId: model.id);
                              },
                              shape: AppStyles.mainShape,
                              title: Text(locale.delete),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              shape: AppStyles.mainShape,
                              title: Text(locale.cancel),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  shape: AppStyles.mainShape,
                  title: Text(locale.delete),
                ),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.dictionary_all_delete_message,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                _categoriesUseCase.deleteAllCategories();
                              },
                              shape: AppStyles.mainShape,
                              title: Text(locale.delete),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              shape: AppStyles.mainShape,
                              title: Text(locale.cancel),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  shape: AppStyles.mainShape,
                  title: Text(locale.deleteAll),
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
