import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_word_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/change_word_popup.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class WordOptions extends StatelessWidget {
  const WordOptions({
    super.key,
    required this.categoryId,
    required this.wordId,
  });

  final int categoryId;
  final int wordId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<UserDictionaryWordEntity>(
      future: Provider.of<UserDictionaryWordState>(context).fetchWordById(
        wordId: wordId,
      ),
      builder: (BuildContext context, AsyncSnapshot<UserDictionaryWordEntity> snapshot) {
        if (snapshot.hasData) {
          final UserDictionaryWordEntity model = snapshot.data!;
          return Padding(
            padding: AppStyles.mainMardingWithoutTop,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.word,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                    color: appColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return AnimatedPadding(
                          padding: MediaQuery.of(context).viewInsets,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.decelerate,
                          child: ChangeWordPopup(model: model),
                        );
                      },
                    );
                  },
                  child: Text(
                    locale!.changeWord,
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingWithoutTop,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteWordMessage,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy',
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondary,
                                    duration: const Duration(milliseconds: 500),
                                    content: SnackBarMessage(
                                      message: locale.wordDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<UserDictionaryWordState>(context, listen: false).deleteWord(wordId: model.id);
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
                    locale.deleteWord,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingWithoutTop,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteAllCategoryWordsMessage,
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondary,
                                    duration: const Duration(milliseconds: 500),
                                    content: SnackBarMessage(
                                      message: locale.wordsDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<UserDictionaryWordState>(context, listen: false).deleteWordsCategory(categoryId: categoryId);
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
                    locale.deleteAllWords,
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
