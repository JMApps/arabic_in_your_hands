import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/flip_share_copy_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondVolumeFlipBackCard extends StatelessWidget {
  const SecondVolumeFlipBackCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VolumeSecondItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 5,
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
              item.translationName != null
                  ? SizedBox(
                    width: double.maxFinite,
                    child: Text(
                        item.translationName!,
                        style: TextStyle(
                          fontSize: 35,
                          color: myColor.myAccentColor,
                        ),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                      ),
                  )
                  : const SizedBox(),
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  item.translationContent,
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                splashRadius: 20,
                icon: Icon(
                  CupertinoIcons.share,
                  color: Theme.of(context).colorScheme.myAccentColor,
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return FlipShareCopySecond(item: item, isFront: false);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
