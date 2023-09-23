import 'package:arabicinyourhands/core/state/provider/words_flip_page_state.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/presentation/widgets/words_flip_back_card.dart';
import 'package:arabicinyourhands/presentation/widgets/words_flip_front_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:provider/provider.dart';

class WordsFlipCardItem extends StatelessWidget {
  const WordsFlipCardItem({Key? key, required this.item})
      : super(key: key);

  final DictionaryWordModel item;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      rotateSide: RotateSide.bottom,
      onTapFlipping: true,
      axis: FlipAxis.vertical,
      controller: FlipCardController(),
      animationDuration: const Duration(milliseconds: 300),
      frontWidget: context.watch<WordsFlipPageState>().getCardMode
          ? WordsFlipFrontCard(item: item)
          : WordsFlipBackCard(item: item),
      backWidget: context.watch<WordsFlipPageState>().getCardMode
          ? WordsFlipBackCard(item: item)
          : WordsFlipFrontCard(item: item),
    );
  }
}
