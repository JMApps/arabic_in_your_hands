import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_word_data_repository.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_word_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_words_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/words_flip_card_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:arabicinyourhands/presentation/widgets/main_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WordsFlipCardList extends StatefulWidget {
  const WordsFlipCardList({
    Key? key,
    required this.wordsCategoryId,
  }) : super(key: key);

  final int wordsCategoryId;

  @override
  State<WordsFlipCardList> createState() => _WordsFlipCardListState();
}

class _WordsFlipCardListState extends State<WordsFlipCardList> {
  late final UserDictionaryWordsUseCase _dictionaryWordsUseCase;
  final PageController _flipWordsController = PageController();

  @override
  void initState() {
    super.initState();
    _dictionaryWordsUseCase = UserDictionaryWordsUseCase(UserDictionaryWordDataRepository.getInstance());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Consumer<UserDictionaryWordState>(
      builder: (BuildContext context, UserDictionaryWordState value, Widget? child) {
        return FutureBuilder<List<UserDictionaryWordEntity>>(
          future: _dictionaryWordsUseCase.fetchCategoryWords(
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
                  const SizedBox(height: 8),
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
              return FutureIsEmpty(message: locale!.words_flip_empty_message);
            }
          },
        );
      },
    );
  }
}
