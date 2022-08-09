import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_share_copy_first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolumeSubChapterContentItemRight extends StatelessWidget {
  const FirstVolumeSubChapterContentItemRight({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final VolumeFirstItemSubChapterContentModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getWatchSettings = context.watch<ContentSettingsState>();
    final getWatchVisibility =
        context.watch<VolumeContentDialogVisibilityState>();
    final getReadContentPlay = context.watch<ContentPlayerState>();
    return Card(
      elevation: 3,
      color: myColor.mainChapterCardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.only(
        top: 16,
        right: 16,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: AnimatedContainer(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            gradient: LinearGradient(
              colors: context.watch<ContentPlayerState>().getPlayingState &&
                      context
                              .watch<ContentPlayerState>()
                              .getCurrentTrackIndex ==
                          index
                  ? [
                      myColor.contentItemSecondSelectedGradientColor,
                      myColor.contentItemFirstSelectedGradientColor,
                    ]
                  : [
                      myColor.contentItemSecondRightGradientColor,
                      myColor.contentItemFirstRightGradientColor,
                    ],
            ),
          ),
          duration: const Duration(milliseconds: 0),
          curve: Curves.bounceIn,
          child: Column(
            children: [
              Visibility(
                visible: getWatchVisibility.getFirstDialogVisibility,
                child: item.arabicName != null
                    ? SizedBox(
                        width: double.infinity,
                        child: Text(
                          '${item.arabicName}',
                          style: TextStyle(
                            color: myColor.myAccentColor,
                            fontFamily: getWatchSettings.getArabicFontName,
                            fontSize: getWatchSettings.getArabicTextSize,
                          ),
                          textAlign: getWatchSettings.getTextAlign,
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    : const SizedBox(),
              ),
              Visibility(
                visible: getWatchVisibility.getFirstDialogVisibility,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    item.arabicContent,
                    style: TextStyle(
                      fontFamily: getWatchSettings.getArabicFontName,
                      fontSize: getWatchSettings.getArabicTextSize,
                    ),
                    textAlign: getWatchSettings.getTextAlign,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Visibility(
                visible: getWatchVisibility.getSecondDialogVisibility,
                child: item.translationName != null
                    ? SizedBox(
                        width: double.infinity,
                        child: Text(
                          '${item.translationName}',
                          style: TextStyle(
                            color: myColor.myAccentColor,
                            fontFamily: getWatchSettings.getTranslationFontName,
                            fontSize: getWatchSettings.getTranslationTextSize,
                          ),
                          textAlign: getWatchSettings.getTextAlign,
                        ),
                      )
                    : const SizedBox(),
              ),
              Visibility(
                visible: getWatchVisibility.getSecondDialogVisibility,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    item.translationContent,
                    style: TextStyle(
                      fontFamily: getWatchSettings.getTranslationFontName,
                      fontSize: getWatchSettings.getTranslationTextSize,
                    ),
                    textAlign: getWatchSettings.getTextAlign,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          getReadContentPlay.playOne(index);
        },
        onLongPress: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return DialogShareCopyFirst(item: item);
            },
          );
        },
      ),
    );
  }
}
