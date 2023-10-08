import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/arabicDictionary/words_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/words_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_item.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchWordsFuture extends StatefulWidget {
  const SearchWordsFuture({super.key, required this.query});

  final String query;

  @override
  State<SearchWordsFuture> createState() => _SearchWordsFutureState();
}

class _SearchWordsFutureState extends State<SearchWordsFuture> {
  List<WordEntity> _words = [];
  List<WordEntity> _recentWords = [];

  late final WordsUseCase _wordsUseCase;

  @override
  void initState() {
    _wordsUseCase = WordsUseCase(WordsDataReposioty.getInstance());
    super.initState();
  }

  // Функция для удаления огласок из арабских слов
  String removeDiacritics(String input) {
    final diacriticsPattern = RegExp(r'[ًٌٍَُِّْ]');
    return input.replaceAll(diacriticsPattern, '');
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<WordEntity>>(
      future: _wordsUseCase.fetchAllWords(),
      builder: (BuildContext context, AsyncSnapshot<List<WordEntity>> snapshot) {
        if (snapshot.hasData) {
          _words = snapshot.data!;
          _recentWords = widget.query.isEmpty
              ? []
              : _words.where((element) {

            final word = removeDiacritics(element.word);
            final shortMeaning = element.shortMeaning;
            final meaning = element.meaning;

            return (word.contains(widget.query.toLowerCase())) ||
                (shortMeaning?.contains(widget.query.toLowerCase()) ?? false) ||
                (meaning?.contains(widget.query.toLowerCase()) ?? false);

              }).toList();
          if (_recentWords.isEmpty && widget.query.isNotEmpty) {
            return FutureIsEmpty(message: locale!.search_is_not_results);
          } else if (_recentWords.isEmpty) {
            return FutureIsEmpty(message: locale!.startSearch);
          } else {
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: _recentWords.length,
                itemBuilder: (BuildContext context, int index) {
                  final WordEntity model = _recentWords[index];
                  return WordItem(model: model);
                },
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
