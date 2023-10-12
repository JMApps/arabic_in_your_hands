import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_flip_back_card.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_flip_front_card.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:provider/provider.dart';

class WordFlipCard extends StatelessWidget {
  const WordFlipCard({
    super.key,
    required this.model,
  });

  final WordEntity model;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentFlipState>(
      builder: (BuildContext context, ContentFlipState flipModeState, _) {
        return FlipCard(
          animationDuration: const Duration(milliseconds: 300),
          rotateSide: RotateSide.bottom,
          onTapFlipping: true,
          axis: FlipAxis.vertical,
          controller: FlipCardController(),
          frontWidget: flipModeState.getCardSideMode
              ? WordFlipFrontCard(word: model.word)
              : WordFlipBackCard(shortMeaning: model.shortMeaning ?? ''),
          backWidget: flipModeState.getCardSideMode
              ? WordFlipBackCard(shortMeaning: model.shortMeaning ?? '')
              : WordFlipFrontCard(word: model.word),
        );
      },
    );
  }
}
