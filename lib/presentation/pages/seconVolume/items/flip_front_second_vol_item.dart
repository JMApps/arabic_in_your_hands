import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlipFrontSecondVolItem extends StatelessWidget {
  const FlipFrontSecondVolItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final ContentSettingsState settingsState = Provider.of<ContentSettingsState>(context);
    return Card(
      margin: AppStyles.mainMardingHorizontal,
      child: Center(
        child: ListTile(
          title: model.arabicName != null
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
          subtitle: Text(
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
    );
  }
}
