import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:arabicinyourhands/presentation/uiState/dialog_show_state.dart';
import 'package:arabicinyourhands/presentation/widgets/second_vol_share_copy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolContentItemLeft extends StatelessWidget {
  const SecondVolContentItemLeft({
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
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: appColors.leftDialogColor,
      child: Card(
        margin: const EdgeInsets.only(left: 5),
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
                  child: SizedBox(
                    width: double.infinity,
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
                              fontFamily: AppStyles.contentTranslationFontList[settingsState.getTranslationFontIndex],
                              fontSize: settingsState.getTranslationTextSize,
                              color: appColors.primary,
                            ),
                            textAlign: AppStyles.contentTranslationFontAlign[settingsState.getTextAlignIndex],
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
                        fontFamily: AppStyles.contentTranslationFontList[settingsState.getTranslationFontIndex],
                        fontSize: settingsState.getTranslationTextSize,
                      ),
                      textAlign: AppStyles.contentTranslationFontAlign[settingsState.getTextAlignIndex],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
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
