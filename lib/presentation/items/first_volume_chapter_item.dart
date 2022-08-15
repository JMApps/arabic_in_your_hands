import 'package:arabicinyourhands/data/database/model/volume_first_item_chapter_model.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/lists/first_volume_sub_chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstVolumeChapterItem extends StatelessWidget {
  const FirstVolumeChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemChapterModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 3,
      color: myColor.mainChapterCardColor,
      margin: const EdgeInsets.only(
        left: 8,
        top: 16,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Card(
            elevation: 2,
            color: myColor.titleChapterCardColor,
            margin: const EdgeInsets.only(
              left: 16,
              top: 16,
              bottom: 8,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: myColor.chapterNumberContainerColor,
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    child: Center(
                      child: Text(
                        item.id.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      trailing: SvgPicture.asset(
                        'assets/icons/${item.chapterIcon}.svg',
                        width: 35,
                        height: 35,
                        color: myColor.chapterIconColor,
                      ),
                      title: Text(
                        item.chapterTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: myColor.chapterTitleColor,
                          fontFamily: 'Gilroy medium',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        item.chapterTitleArabic,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Scheherazade',
                          fontWeight: FontWeight.normal,
                          color: myColor.chapterSubTitleColor,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: FirstVolumeSubChapterList(
              chapterId: item.id,
            ),
          ),
        ],
      ),
    );
  }
}
