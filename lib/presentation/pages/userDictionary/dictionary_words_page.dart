import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/word_category_args.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/lists/dictionary_words_list.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/add_word_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DictionaryWordsPage extends StatelessWidget {
  const DictionaryWordsPage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final UserDictionaryCategoryEntity categoryModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              centerTitle: true,
              floating: true,
              snap: false,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: 60,
              title: Text(locale!.words),
              actions: [
                IconButton(
                  icon: const Icon(CupertinoIcons.creditcard),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/words_content_flip',
                      arguments: WordCategoryArgs(
                        model: categoryModel,
                      ),
                    );
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 4,
                    color: HexColor.fromHex(categoryModel.wordCategoryColor),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 0,
                    margin: AppStyles.mainMardingHorizontalMini,
                    color: appColors.secondary,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Text(
                        categoryModel.wordCategoryTitle,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          child: DictionaryWordsList(
            categoryId: categoryModel.id,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColors.secondary,
        child: const Icon(CupertinoIcons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 250),
                curve: Curves.decelerate,
                child: AddWordPopup(
                  categoryId: categoryModel.id,
                  categoryPriority: categoryModel.priority,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
