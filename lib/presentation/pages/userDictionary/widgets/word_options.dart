import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_word_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_words_use_case.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordOptions extends StatefulWidget {
  const WordOptions({
    Key? key,
    required this.categoryId,
    required this.wordId,
  }) : super(key: key);

  final int categoryId;
  final int wordId;

  @override
  State<WordOptions> createState() => _WordOptionsState();
}

class _WordOptionsState extends State<WordOptions> {
  late final UserDictionaryWordsUseCase _wordsUseCase;

  @override
  void initState() {
    _wordsUseCase = UserDictionaryWordsUseCase(UserDictionaryWordDataRepository.getInstance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<UserDictionaryWordEntity>>(
      future: _wordsUseCase.fetchWordById(
        wordId: widget.wordId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryWordEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final UserDictionaryWordEntity model = snapshot.data![0];
          return Container(
            padding: AppStyles.mainMarding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.word,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appColors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
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
                            child: Container() // Change word popup
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    locale.change,
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.dictionary_word_delete_message,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                _wordsUseCase.deleteWord(wordId: model.id);
                              },
                              child: Text(
                                locale.delete,
                                style: TextStyle(color: appColors.error),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                locale.cancel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    locale.delete,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.allWordsDeleteMessage,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                _wordsUseCase.deleteWordsCategory(categoryId: widget.categoryId);
                              },
                              child: Text(
                                locale.delete,
                                style: TextStyle(color: appColors.error),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                locale.cancel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    locale.deleteAll,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
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
