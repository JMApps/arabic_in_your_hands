import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/player/content_player_state.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:arabicinyourhands/presentation/uiState/dialog_show_state.dart';
import 'package:arabicinyourhands/presentation/widgets/first_vol_share_copy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVoContentItemLeft extends StatelessWidget {
  const FirstVoContentItemLeft({
    super.key,
    required this.model,
    required this.index,
  });

  final FirstVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final ContentSettingsState settingsState = Provider.of<ContentSettingsState>(context);
    final DialogShowState dialogShowState = Provider.of<DialogShowState>(context);
    final ContentPlayerState playerState = Provider.of<ContentPlayerState>(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: appColors.leftDialogColor,
      child: Card(
        margin: const EdgeInsets.only(right: 5),
        child: InkWell(
          onTap: () {
            playerState.playOne(trackIndex: index);
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return FirstVolShareCopy(model: model);
              },
            );
          },
          borderRadius: AppStyles.mainBorder,
          child: AnimatedContainer(
            padding: AppStyles.mainMarding,
            duration: const Duration(milliseconds: 75),
            curve: Curves.easeInCubic,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: dialogShowState.getDialogArabicIsShow,
                  child: model.arabicName != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '${model.arabicName}',
                            style: TextStyle(
                              fontFamily: AppStyles.contentArabicFontList[settingsState.getArabicFontIndex],
                              fontSize: settingsState.getArabicTextSize,
                              color: appColors.primary,
                            ),
                            textAlign: AppStyles.contentArabicFontAlign[settingsState.getTextAlignIndex],
                            textDirection: TextDirection.rtl,
                          ),
                        )
                      : const SizedBox(),
                ),
                Visibility(
                  visible: dialogShowState.getDialogArabicIsShow,
                  child: Text(
                    model.arabicContent,
                    style: TextStyle(
                      fontFamily: AppStyles.contentArabicFontList[settingsState.getArabicFontIndex],
                      fontSize: settingsState.getArabicTextSize,
                    ),
                    textAlign: AppStyles.contentArabicFontAlign[settingsState.getTextAlignIndex],
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: dialogShowState.getDialogTranslationIsShow,
                  child: model.translationName != null
                      ? Text(
                          '${model.translationName}',
                          style: TextStyle(
                            fontFamily: AppStyles.contentTranslationFontList[settingsState.getTranslationFontIndex],
                            fontSize: settingsState.getTranslationTextSize,
                            color: appColors.primary,
                          ),
                          textAlign: AppStyles.contentTranslationFontAlign[settingsState.getTextAlignIndex],
                        )
                      : const SizedBox(),
                ),
                Visibility(
                  visible: dialogShowState.getDialogTranslationIsShow,
                  child: Text(
                    model.translationContent,
                    style: TextStyle(
                      fontFamily: AppStyles.contentTranslationFontList[settingsState.getTranslationFontIndex],
                      fontSize: settingsState.getTranslationTextSize,
                    ),
                    textAlign: AppStyles.contentTranslationFontAlign[settingsState.getTextAlignIndex],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
