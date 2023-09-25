import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/first_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/main_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolumeSubChapterItem extends StatelessWidget {
  const FirstVolumeSubChapterItem({
    super.key,
    required this.model,
    required this.index,
  });

  final FirstVolSubChapterEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MainNavigationState navigationState = Provider.of<MainNavigationState>(context);
    return Card(
      color: appColors.subTitleChapterCardColor,
      child: InkWell(
        onTap: () {
          navigationState.changeFirstSelectedItem(model.id);
          Navigator.pushNamed(
            context,
            '/first_vol_contents_page',
            arguments: FirstSubChapterArgs(
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
