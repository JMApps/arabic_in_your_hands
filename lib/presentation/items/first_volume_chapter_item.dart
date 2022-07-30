import 'package:arabicinyourhands/data/database/model/volume_first_item_chapter_model.dart';
import 'package:arabicinyourhands/presentation/lists/first_volume_sub_chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstVolumeChapterItem extends StatelessWidget {
  const FirstVolumeChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemChapterModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(
        left: 8,
        top: 8,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          top: 8,
          bottom: 8,
        ),
        child: Column(
          children: [
            Card(
              elevation: 1,
              color: Colors.teal[100],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
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
                          ),
                        ),
                        subtitle: Text(
                          item.chapterTitleArabic,
                          style: const TextStyle(
                            fontSize: 18,
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
              child: FirstVolumeSubChapterList(
                displayBy: item.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
