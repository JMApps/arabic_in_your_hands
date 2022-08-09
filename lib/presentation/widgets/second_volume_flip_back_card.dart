import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_content_model.dart';
import 'package:flutter/material.dart';

class SecondVolumeFlipBackCard extends StatelessWidget {
  const SecondVolumeFlipBackCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VolumeSecondItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
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
    );
  }
}
