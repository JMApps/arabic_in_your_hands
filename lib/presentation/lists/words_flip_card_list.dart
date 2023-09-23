import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/core/state/provider/words_flip_page_state.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/items/words_flip_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordsFlipCardList extends StatelessWidget {
  const WordsFlipCardList({
    Key? key,
    required this.wordsCategoryId,
  }) : super(key: key);

  final int wordsCategoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<DictionaryContentState>().getDictionaryDatabaseQuery.getWordsCategory(wordsCategoryId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return WordsFlipCardItem(
                    item: snapshot.data![index],
                  );
                },
                onPageChanged: (int pageNumber) {
                  context.read<WordsFlipPageState>().changePageIndex(pageNumber);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedSmoothIndicator(
                activeIndex: context.watch<WordsFlipPageState>().getCurrentWordsFlipPageIndex,
                count: snapshot.data!.length,
                effect: ScrollingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Theme.of(context).colorScheme.myAccentColor,
                  activeDotColor:
                  Theme.of(context).colorScheme.myPrimaryColor,
                ),
              ),
            )
          ],
        )
            : Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppLocalizations.of(context)!.words_flip_empty_message,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
