import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/main_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeSubChapterItem extends StatelessWidget {
  const SecondVolumeSubChapterItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolSubChapterEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final MainNavigationState navigationState =
        Provider.of<MainNavigationState>(context);
    return Card(
      color: navigationState.getCurrentSecondSelectedItem == model.id
          ? myColor.subChapterSelectedColor
          : model.id.isOdd
              ? myColor.subChapterUnSelectedOddColor
              : myColor.subChapterUnSelectedIsOddColor,
      margin: const EdgeInsets.only(
        left: 16,
        bottom: 16,
      ),
      child: InkWell(
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
                  gradient: LinearGradient(
                    colors: [
                      myColor.subChapterSecondGradientColor,
                      myColor.subChapterSecondGradientColor,
                    ],
                  ),
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
                    model.dialogTitle,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          navigationState.changeSecondSelectedItem(model.id);
          // Navigator.pushNamed(
          //   context,
          //   '/first_volume_content',
          //   arguments: ContentVolumeOneArguments(
          //     1, // Тут нужно будет передать что надо
          //     model.id,
          //     index,
          //   ),
          // );
        },
      ),
    );
  }
}
