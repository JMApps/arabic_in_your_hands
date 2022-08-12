import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SecondVolumeFlipFrontCard extends StatelessWidget {
  const SecondVolumeFlipFrontCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VolumeSecondItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 10,
      color: myColor.flipBackColor,
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
                      style: TextStyle(
                        fontSize: 35,
                        color: myColor.myAccentColor,
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
    );
  }
}