import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/words_flip_back_card.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/words_flip_front_card.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:provider/provider.dart';

class WordsFlipCardItem extends StatelessWidget {
  const WordsFlipCardItem({
    super.key,
    required this.model,
  });

  final UserDictionaryWordEntity model;

  @override
  Widget build(BuildContext context) {
    final ContentFlipState flipMode = context.watch<ContentFlipState>();
    return FlipCard(
      rotateSide: RotateSide.bottom,
      onTapFlipping: true,
      axis: FlipAxis.vertical,
      controller: FlipCardController(),
      animationDuration: const Duration(milliseconds: 300),
      frontWidget: flipMode.getCardSideMode
          ? WordsFlipBackCard(model: model)
          : WordsFlipFrontCard(model: model),
      backWidget: flipMode.getCardSideMode
          ? WordsFlipFrontCard(model: model)
          : WordsFlipBackCard(model: model),
    );
  }
}
