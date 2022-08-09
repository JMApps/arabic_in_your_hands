import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/presentation/widgets/first_volume_flip_back_card.dart';
import 'package:arabicinyourhands/presentation/widgets/first_volume_flip_front_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class FirstVolumeFlipCardItem extends StatelessWidget {
  const FirstVolumeFlipCardItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      rotateSide: RotateSide.bottom,
      onTapFlipping: true,
      axis: FlipAxis.vertical,
      controller: FlipCardController(),
      animationDuration: const Duration(milliseconds: 300),
      frontWidget: FirstVolumeFlipFrontCard(item: item),
      backWidget: FirstVolumeFlipBackCard(item: item),
    );
  }
}
