import 'package:arabicinyourhands/data/database/model/content_volume_two_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeSubChapterItem extends StatelessWidget {
  const SecondVolumeSubChapterItem({
    Key? key,
    required this.item,
    required this.subChapterIndex,
  }) : super(key: key);

  final VolumeSecondItemSubChapterModel item;
  final int subChapterIndex;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 5,
      color: context.watch<MainNavigationSelectedState>().getCurrentSecondSelectedItem == item.id
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
                      color: Colors.white,
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
                      fontFamily: 'Gilroy medium',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          context.read<MainNavigationSelectedState>().updateSecondSelectedState(item.id);
          Navigator.pushNamed(
            context,
            '/second_volume_content',
            arguments: ContentVolumeTwoArguments(
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
