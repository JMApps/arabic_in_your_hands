import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/core/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_share_copy_first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolContentItemRight extends StatelessWidget {
  const FirstVolContentItemRight({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  final FirstVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final getWatchSettings = context.watch<ContentSettingsState>();
    final getWatchVisibility =
        context.watch<VolumeContentDialogVisibilityState>();
    final getReadContentPlay = context.watch<ContentPlayerState>();
    return Card(
      shape: AppStyles.mainShape,
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: AnimatedContainer(
          padding: AppStyles.mainMarding,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
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
                child: model.arabicName != null
                    ? SizedBox(
                        width: double.infinity,
                        child: Text(
                          '${model.arabicName}',
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
                    model.arabicContent,
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
                child: model.translationName != null
                    ? SizedBox(
                        width: double.infinity,
                        child: Text(
                          '${model.translationName}',
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
                    model.translationContent,
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
              return DialogShareCopyFirst(item: model);
            },
          );
        },
      ),
    );
  }
}
