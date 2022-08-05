import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
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
    final getWatchSettings = context.watch<ContentSettingsState>();
    final getWatchVisibility =
        context.watch<VolumeContentDialogVisibilityState>();
    return Card(
      elevation: 1,
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
      child: AnimatedContainer(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          gradient: LinearGradient(
            colors: context.watch<ContentPlayerState>().getPlayingState &&
                    context.watch<ContentPlayerState>().getCurrentTrackIndex == index
                ? [
                    const Color(0xFFFFFFFF),
                    const Color(0xBFFFEABD),
                  ]
                : [
                    const Color(0xFFFFFFFF),
                    const Color(0xBFBEEBFF),
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
                          color: const Color(0xFF243743),
                          fontFamily: getWatchSettings.getArabicFontName,
                          fontSize: getWatchSettings.getArabicTextSize,
                        ),
                        textAlign: getWatchSettings.getTextAlign,
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
                          color: const Color(0xFF006D50),
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
    );
  }
}
