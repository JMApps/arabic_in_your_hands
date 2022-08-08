import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
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
      frontWidget: Card(
        elevation: 3,
        color: Colors.green[100],
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.arabicName != null
                    ? Text(
                        item.arabicName!,
                        style: const TextStyle(
                          fontSize: 35,
                          color: Color(0xFF209372),
                          fontFamily: 'Scheherazade',
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
                Text(
                  item.arabicContent,
                  style: const TextStyle(
                    fontSize: 35,
                    fontFamily: 'Scheherazade',
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      backWidget: Card(
        elevation: 3,
        color: Colors.blueGrey[100],
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.translationName != null
                    ? Text(
                        item.translationName!,
                        style: const TextStyle(
                          fontSize: 35,
                          color: Color(0xFF243743),
                        ),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
                Text(
                  item.translationContent,
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
