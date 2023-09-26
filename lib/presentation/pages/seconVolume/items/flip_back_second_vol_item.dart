import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlipBackSecondVolItem extends StatelessWidget {
  const FlipBackSecondVolItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SecondVolContentEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ContentSettingsState settingsState = Provider.of<ContentSettingsState>(context);
    return Card(
      margin: AppStyles.mainMardingHorizontal,
      child: Center(
        child: ListTile(
          title: model.translationName != null
              ? SizedBox(
            width: double.infinity,
            child: Text(
              '${model.translationName}',
              style: TextStyle(
                fontFamily: AppStyles.contentTranslationFontList[settingsState.getTranslationFontIndex],
                fontSize: settingsState.getTranslationTextSize,
              ),
              textAlign: AppStyles.contentTranslationFontAlign[settingsState.getTextAlignIndex],
            ),
          )
              : const SizedBox(),
          subtitle:  Text(
            model.translationContent,
            style: TextStyle(
              fontFamily: AppStyles.contentTranslationFontList[settingsState.getTranslationFontIndex],
              fontSize: settingsState.getTranslationTextSize,
            ),
            textAlign: AppStyles.contentTranslationFontAlign[settingsState.getTextAlignIndex],
          ),
        ),
      ),
    );
  }
}
