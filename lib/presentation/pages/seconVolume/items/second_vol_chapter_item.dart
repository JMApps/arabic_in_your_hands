import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/lists/second_vol_sub_chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondVolChapterItem extends StatelessWidget {
  const SecondVolChapterItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolChapterEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingMini,
      color: appColors.mainCardColor,
      child: Column(
        children: [
          Card(
            margin: AppStyles.mainMardingMini,
            shape: AppStyles.mainShape,
            color: appColors.titleChapterCardColor,
            elevation: 0.5,
            child: Padding(
              padding: AppStyles.mainMardingMini,
              child: Row(
                children: [
                  FloatingActionButton.small(
                    onPressed: null,
                    elevation: 0,
                    heroTag: 'second_${model.id}',
                    backgroundColor: appColors.primaryDark,
                    child: Text(
                      model.id.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
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
                        'assets/icons/ic_two_${model.id}.svg',
                        width: 35,
                        height: 35,
                        colorFilter: ColorFilter.mode(
                          appColors.mainIconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Text(
                        model.chapterTitleArabic,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Scheherazade',
                          color: appColors.secondary,
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
            height: 200,
            child: SeconVolSubChapterList(
              secondChapterId: model.id,
            ),
          ),
        ],
      ),
    );
  }
}
