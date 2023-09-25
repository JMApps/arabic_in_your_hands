import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/widgets/second_volume_flip_back_card.dart';
import 'package:arabicinyourhands/presentation/widgets/second_volume_flip_front_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:provider/provider.dart';

class SecondVolumeFlipCardItem extends StatelessWidget {
  const SecondVolumeFlipCardItem({Key? key, required this.item})
      : super(key: key);

  final FirstVolContentEntity item;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      rotateSide: RotateSide.bottom,
      onTapFlipping: true,
      axis: FlipAxis.vertical,
      controller: FlipCardController(),
      animationDuration: const Duration(milliseconds: 300),
      frontWidget: context.watch<ContentFlipState>().getCardSideMode
          ? SecondVolumeFlipFrontCard(item: item)
          : SecondVolumeFlipBackCard(item: item),
      backWidget: context.watch<ContentFlipState>().getCardSideMode
          ? SecondVolumeFlipBackCard(item: item)
          : SecondVolumeFlipFrontCard(item: item),
    );
  }
}
