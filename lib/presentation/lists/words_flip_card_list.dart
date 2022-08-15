import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/state/provider/words_flip_page_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/items/words_flip_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            : const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Чтобы воспользоваться режимом карточек, вы должны добавить слова в текущую категорию',
              style: TextStyle(
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
