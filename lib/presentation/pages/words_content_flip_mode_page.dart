import 'package:arabicinyourhands/domain/state/provider/words_flip_page_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/lists/words_flip_card_list.dart';
import 'package:arabicinyourhands/presentation/widgets/add_word_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WordsContentFlipModePage extends StatelessWidget {
  const WordsContentFlipModePage({
    Key? key,
    required this.wordsCategoryId,
    required this.wordsCategoryTitle,
    required this.wordsCategoryPriority,
  }) : super(key: key);

  final int wordsCategoryId;
  final String wordsCategoryTitle;
  final int wordsCategoryPriority;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WordsFlipPageState>(
          create: (_) => WordsFlipPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Режим карточек'),
          actions: [
            IconButton(
              splashRadius: 20,
              icon: const Icon(
                CupertinoIcons.add_circled,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: AnimatedPadding(
                        padding: MediaQuery.of(context).viewInsets,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                        child: AddWordPopup(
                          categoryId: wordsCategoryId,
                          categoryPriority: wordsCategoryPriority,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Consumer<WordsFlipPageState>(
              builder: (context, wordsFlipState, _) {
                return IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    CupertinoIcons.creditcard_fill,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    wordsFlipState.changeCardMode();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Card(
              color: Theme.of(context).colorScheme.myAccentColor,
              margin: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: Text(
                  wordsCategoryTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Gilroy medium',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: WordsFlipCardList(
                wordsCategoryId: wordsCategoryId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
