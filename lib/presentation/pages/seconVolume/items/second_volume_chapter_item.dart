import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';
import 'package:arabicinyourhands/main.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/lists/second_volume_sub_chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondVolumeChapterItem extends StatelessWidget {
  const SecondVolumeChapterItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolChapterEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMardingMini,
      child: Column(
        children: [
          Card(
            margin: AppStyles.mainMarding,
            shape: AppStyles.mainShape,
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Text(
                      model.id.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                      trailing: SvgPicture.asset(
                        'assets/icons/ic_one_${model.id}.svg',
                        width: 35,
                        height: 35,
                      ),
                      title: Text(
                        model.chapterTitleArabic,
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Scheherazade',
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                      subtitle: Text(
                        model.chapterTitle,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: PageStorage(
              bucket: globalBucketSecondVolumeSubChapters,
              child: SecondVolumeSubChapterList(
                key: PageStorageKey<int>(model.id),
                secondChapterId: model.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
