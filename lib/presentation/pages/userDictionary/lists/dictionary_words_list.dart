import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_word_data_repository.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_word_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_words_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/dictionary_word_item.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class DictionaryWordsList extends StatefulWidget {
  const DictionaryWordsList({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  State<DictionaryWordsList> createState() => _DictionaryWordsListState();
}

class _DictionaryWordsListState extends State<DictionaryWordsList> {
  late final UserDictionaryWordsUseCase _dictionaryWordsUseCase;

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
          future: _dictionaryWordsUseCase.fetchCategoryWords(categoryId: widget.categoryId),
          builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryWordEntity>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return CupertinoScrollbar(
                child: AnimationLimiter(
                  child: ListView.builder(
                    padding: AppStyles.mainMardingMini,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final UserDictionaryWordEntity model = snapshot.data![index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 350),
                        child: SlideAnimation(
                          verticalOffset: 250,
                          child: FadeInAnimation(
                            child: DictionaryWordItem(
                              model: model,
                              categoryId: widget.categoryId,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return ErrorDataText(error: snapshot.error.toString());
            } else {
              return FutureIsEmpty(message: locale!.dictionary_word_add_first);
            }
          },
        );
      },
    );
  }
}
