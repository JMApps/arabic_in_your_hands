import 'package:arabicinyourhands/data/database/model/volume_second_item_chapter_model.dart';
import 'package:arabicinyourhands/presentation/lists/second_volume_sub_chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondVolumeChapterItem extends StatelessWidget {
  const SecondVolumeChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeSecondItemChapterModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(
        right: 8,
        top: 16,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Card(
            elevation: 1,
            color: const Color(0xFFD5FFEF),
            margin: const EdgeInsets.only(
              right: 16,
              top: 16,
              bottom: 8,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/${item.chapterIcon}.svg',
                        width: 35,
                        height: 35,
                        color: const Color(0xFF006D50),
                      ),
                      title: Text(
                        item.chapterTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF243743),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        item.chapterTitleArabic,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Scheherazade',
                          color: Color(0xFF006D50),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF243743),
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: SecondVolumeSubChapterList(
              displayBy: item.id,
            ),
          ),
        ],
      ),
    );
  }
}
