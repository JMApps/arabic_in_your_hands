import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/core/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_share_copy_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeSubChapterContentItemRight extends StatelessWidget {
  const SecondVolumeSubChapterContentItemRight({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final SecondVolContentEntity item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getWatchSettings = context.watch<ContentSettingsState>();
    final getWatchVisibility = context.watch<VolumeContentDialogVisibilityState>();
    final getReadContentPlay = context.watch<ContentPlayerState>();
    return Card(
      elevation: 3,
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
              return DialogShareCopySecond(item: item);
            },
          );
        },
      ),
    );
  }
}
