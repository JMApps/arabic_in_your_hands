import 'package:arabicinyourhands/presentation/uiState/main_navigation_state.dart';
import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FistVolumeSubChapterItem extends StatelessWidget {
  const FistVolumeSubChapterItem({
    Key? key,
    required this.item,
    required this.subChapterIndex,
  }) : super(key: key);

  final VolumeFirstItemSubChapterModel item;
  final int subChapterIndex;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 5,
      color: context.watch<MainNavigationState>().getCurrentFirstSelectedItem == item.id
          ? myColor.subChapterSelectedColor
          : item.id.isOdd
              ? myColor.subChapterUnSelectedOddColor
              : myColor.subChapterUnSelectedIsOddColor,
      margin: const EdgeInsets.only(
        left: 16,
        bottom: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Wrap(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          myColor.subChapterFirstGradientColor,
                          myColor.subChapterSecondGradientColor,
                        ],
                      ),
                    ),
                    child: Text(
                      item.dialog,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    item.dialogTitle,
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
        onTap: () {
          context
              .read<MainNavigationState>()
              .changeFirstSelectedItem(item.id);
          Navigator.pushNamed(
            context,
            '/first_volume_content',
            arguments: ContentVolumeOneArguments(
              item.displayBy,
              item.id,
              subChapterIndex,
            ),
          );
        },
      ),
    );
  }
}
