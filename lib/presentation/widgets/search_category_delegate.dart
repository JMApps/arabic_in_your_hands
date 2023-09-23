import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/items/dictionary_category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SearchCategoryDelegate extends SearchDelegate {
  List<DictionaryCategoryModel> categories = [];
  List<DictionaryCategoryModel> recentCategories = [];

  SearchCategoryDelegate({
    String hintText = 'Поиск категорий...',
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Theme.of(context)
                    .colorScheme
                    .bottomNavigationSelectedItemColor,
                progress: transitionAnimation,
              ),
              onPressed: () {
                query = '';
              },
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.chapterIconColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List>(
      future: context
          .watch<DictionaryContentState>()
          .getDictionaryDatabaseQuery
          .getAllCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          categories = snapshot.data;
          recentCategories = query.isEmpty
              ? categories
              : categories
                  .where((element) => element.wordCategoryTitle
                      .toLowerCase()
                      .contains(query.toLowerCase()))
                  .toList();
          return recentCategories.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.search_is_not_results,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DictionaryCategoryItem(
                        item: recentCategories[index],
                      );
                    },
                  ),
                );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                AppLocalizations.of(context)!.categories_is_empty,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List>(
      future: context
          .watch<DictionaryContentState>()
          .getDictionaryDatabaseQuery
          .getAllCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          categories = snapshot.data;
          recentCategories = query.isEmpty
              ? categories
              : categories
                  .where((element) => element.wordCategoryTitle
                      .toLowerCase()
                      .contains(query.toLowerCase()))
                  .toList();
          return recentCategories.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.search_is_not_results,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DictionaryCategoryItem(
                        item: recentCategories[index],
                      );
                    },
                  ),
                );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                AppLocalizations.of(context)!.categories_is_empty,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }
}
