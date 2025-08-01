import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/search_words_future.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class SearchWordsDelegate extends SearchDelegate {
  SearchWordsDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          searchFieldStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
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
    return SearchWordsFuture(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 3) {
      return SearchWordsFuture(query: query);
    } else {
      final AppLocalizations? locale = AppLocalizations.of(context);
      return FutureIsEmpty(message: locale!.startSearch);
    }
  }
}
