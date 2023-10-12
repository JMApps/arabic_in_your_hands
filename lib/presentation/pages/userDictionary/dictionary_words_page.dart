import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/word_category_args.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/lists/dictionary_words_list.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/add_word_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryWordsPage extends StatelessWidget {
  const DictionaryWordsPage({
    super.key,
    required this.categoryModel,
  });

  final UserDictionaryCategoryEntity categoryModel;

  @override
  Widget build(BuildContext context) {
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
              title: Text(categoryModel.wordCategoryTitle),
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
              child: Container(
                height: 5,
                color: HexColor.fromHex(categoryModel.wordCategoryColor),
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
        elevation: 2,
        child: const Icon(CupertinoIcons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
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
