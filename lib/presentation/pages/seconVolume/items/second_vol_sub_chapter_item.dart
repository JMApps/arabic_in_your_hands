import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/second_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:flutter/material.dart';

class SecondVolSubChapterItem extends StatelessWidget {
  const SecondVolSubChapterItem({
    super.key,
    required this.model,
  });

  final SecondVolSubChapterEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.subTitleChapterCardColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/second_vol_contents_page',
            arguments: SecondSubChapterArgs(
              model: model,
            ),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: AppStyles.mainMardingMini,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.5),
                    bottomRight: Radius.circular(12.5),
                  ),
                  gradient: appColors.mainGradient,
                ),
                child: Text(
                  model.dialogTitle,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    model.dialogSubTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
