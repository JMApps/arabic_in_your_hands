import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_word_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/words_flip_card_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:arabicinyourhands/presentation/widgets/main_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class WordsFlipCardList extends StatefulWidget {
  const WordsFlipCardList({
    super.key,
    required this.wordsCategoryId,
  });

  final int wordsCategoryId;

  @override
  State<WordsFlipCardList> createState() => _WordsFlipCardListState();
}

class _WordsFlipCardListState extends State<WordsFlipCardList> {
  final PageController _flipWordsController = PageController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<UserDictionaryWordEntity>>(
      future: Provider.of<UserDictionaryWordState>(context).fetchWordByCategoryId(
        categoryId: widget.wordsCategoryId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryWordEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _flipWordsController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final UserDictionaryWordEntity model = snapshot.data![index];
                    return WordsFlipCardItem(
                      model: model,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: AppStyles.mainMardingHorizontal,
                child: MainSmoothPageIndicator(
                  controller: _flipWordsController,
                  length: snapshot.data!.length,
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(error: snapshot.error.toString());
        } else {
          return FutureIsEmpty(message: locale!.wordsFlipEmptyMessage);
        }
      },
    );
  }
}
