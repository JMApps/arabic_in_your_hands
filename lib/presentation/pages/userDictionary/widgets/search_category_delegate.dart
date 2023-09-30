import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/search_category_future.dart';
import 'package:flutter/material.dart';

class SearchCategoryDelegate extends SearchDelegate {
  SearchCategoryDelegate({
    required String hintText,
  }) : super(searchFieldLabel: hintText, keyboardType: TextInputType.text);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {
                query = '';
              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: transitionAnimation,
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchCategoryFuture(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchCategoryFuture(query: query);
  }
}
