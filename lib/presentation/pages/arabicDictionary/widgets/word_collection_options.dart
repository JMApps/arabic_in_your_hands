import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/word_collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WordCollectionOptions extends StatelessWidget {
  const WordCollectionOptions({
    super.key,
    required this.wordId,
    required this.wordCollectionId,
  });

  final int wordId;
  final int wordCollectionId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<WordEntity>(
      future: Provider.of<WordCollectionState>(context, listen: false).fetchWordById(
        wordId: wordId,
      ),
      builder: (BuildContext context, AsyncSnapshot<WordEntity> snapshot) {
        if (snapshot.hasData) {
          final WordEntity model = snapshot.data!;
          return Container(
            padding: AppStyles.mainMarding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.word,
                  style: const TextStyle(
                    fontSize: 35,
                    fontFamily: 'Uthmanic',
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
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
                              locale.deleteWordMessage,
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
                                      message: locale.wordDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<WordCollectionState>(context, listen: false).deleteWordFromCollection(wordId: model.id);
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
                      builder: (context) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteAllCollectionWordsMessage,
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
                                Provider.of<WordCollectionState>(context, listen: false).deleteAllWordsFromCollection(collectionId: wordCollectionId);
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
