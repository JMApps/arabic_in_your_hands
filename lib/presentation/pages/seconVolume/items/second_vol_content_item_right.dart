import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/dialog_show_state.dart';
import 'package:arabicinyourhands/presentation/widgets/second_vol_share_copy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolContentItemRight extends StatelessWidget {
  const SecondVolContentItemRight({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  final SecondVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final ContentSettingsState settingsState = Provider.of<ContentSettingsState>(context);
    final DialogShowState dialogShowState = Provider.of<DialogShowState>(context);
    final getReadContentPlay = context.watch<ContentPlayerState>();
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: appColors.rightDialogColor,
      child: Card(
        margin: const EdgeInsets.only(right: 5),
        child: InkWell(
          borderRadius: AppStyles.mainBorder,
          child: AnimatedContainer(
            padding: AppStyles.mainMarding,
            duration: const Duration(milliseconds: 75),
            curve: Curves.easeInCubic,
            child: Column(
              children: [
                Visibility(
                  visible: dialogShowState.getDialogArabicIsShow,
                  child: model.arabicName != null
                      ? SizedBox(
                          width: double.infinity,
                          child: Text(
                            '${model.arabicName}',
                            style: TextStyle(
                              fontFamily: settingsState.getArabicFontName,
                              fontSize: settingsState.getArabicTextSize,
                              color: appColors.secondary,
                            ),
                            textAlign: settingsState.getTextAlign,
                            textDirection: TextDirection.rtl,
                          ),
                        )
                      : const SizedBox(),
                ),
                Visibility(
                  visible: dialogShowState.getDialogArabicIsShow,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      model.arabicContent,
                      style: TextStyle(
                        fontFamily: settingsState.getArabicFontName,
                        fontSize: settingsState.getArabicTextSize,
                      ),
                      textAlign: settingsState.getTextAlign,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: dialogShowState.getDialogTranslationIsShow,
                  child: model.translationName != null
                      ? SizedBox(
                          width: double.infinity,
                          child: Text(
                            '${model.translationName}',
                            style: TextStyle(
                              fontFamily: settingsState.getTranslationFontName,
                              fontSize: settingsState.getTranslationTextSize,
                              color: appColors.secondary,
                            ),
                            textAlign: settingsState.getTextAlign,
                          ),
                        )
                      : const SizedBox(),
                ),
                Visibility(
                  visible: dialogShowState.getDialogTranslationIsShow,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      model.translationContent,
                      style: TextStyle(
                        fontFamily: settingsState.getTranslationFontName,
                        fontSize: settingsState.getTranslationTextSize,
                      ),
                      textAlign: settingsState.getTextAlign,
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
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SecondVolShareCopy(model: model);
              },
            );
          },
        ),
      ),
    );
  }
}
