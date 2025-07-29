import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:arabicinyourhands/presentation/widgets/main_app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class SettingsContentPage extends StatelessWidget {
  const SettingsContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale!.settings),
        backgroundColor: appColors.primaryColor,
        leading: const MainAppIcon(),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainMarding,
        child: Consumer<ContentSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  locale.arabicFont,
                  style: AppStyles.mainTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appColors.secondary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Text(
                      'Scheher.',
                      style: AppStyles.mainTextStyle,
                    ),
                    1: Text(
                      'Lateef',
                      style: AppStyles.mainTextStyle,
                    ),
                    2: Text(
                      'Markazi',
                      style: AppStyles.mainTextStyle,
                    ),
                  },
                  groupValue: settingsState.getArabicFontIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeArabicFontIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.translationFont,
                  style: AppStyles.mainTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appColors.secondary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Text(
                      'Gilroy',
                      style: AppStyles.mainTextStyle,
                    ),
                    1: Text(
                      'Roboto',
                      style: AppStyles.mainTextStyle,
                    ),
                    2: Text(
                      'Montserrat',
                      style: AppStyles.mainTextStyle,
                    ),
                  },
                  groupValue: settingsState.getTranslationFontIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeFontIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.textAlign,
                  style: AppStyles.mainTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appColors.secondary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Icon(CupertinoIcons.text_alignleft),
                    1: Icon(CupertinoIcons.text_aligncenter),
                    2: Icon(CupertinoIcons.text_alignright),
                    3: Icon(CupertinoIcons.text_justify),
                  },
                  groupValue: settingsState.getTextAlignIndex,
                  onValueChanged: (int? index) {
                    settingsState.changeTextAlignIndex = index!;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  locale.arabicTextSize,
                  style: AppStyles.mainTextStyle,
                ),
                Slider(
                  activeColor: appColors.secondary,
                  value: settingsState.getArabicTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: settingsState.getArabicTextSize.round().toString(),
                  onChanged: (double? size) {
                    settingsState.changeArabicTextSize = size!;
                  },
                ),
                Text(
                  locale.translationTextSize,
                  style: AppStyles.mainTextStyle,
                ),
                Slider(
                  activeColor: appColors.secondary,
                  value: settingsState.getTranslationTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: settingsState.getTranslationTextSize.round().toString(),
                  onChanged: (double? size) {
                    settingsState.changeTextSize = size!;
                  },
                ),
                SwitchListTile(
                  value: settingsState.getAdaptiveTheme,
                  onChanged: (bool? onChanged) {
                    settingsState.changeAdaptiveTheme = onChanged!;
                  },
                  contentPadding: AppStyles.mainMardingHorizontalMini,
                  title: Text(
                    locale.adaptiveTheme,
                    style: AppStyles.mainTextStyle,
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getDarkTheme,
                  onChanged: settingsState.getAdaptiveTheme
                      ? null
                      : (bool? onChanged) {
                          settingsState.changeDarkTheme = onChanged!;
                        },
                  contentPadding: AppStyles.mainMardingHorizontalMini,
                  title: Text(
                    locale.userTheme,
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getWakeLock,
                  onChanged: (bool? onChanged) {
                    settingsState.changeWakeLock = onChanged!;
                  },
                  contentPadding: AppStyles.mainMardingHorizontalMini,
                  title: Text(
                    locale.displayIsAlways,
                    style: AppStyles.mainTextStyle,
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getIsRubDictionary,
                  onChanged: (bool? onChanged) {
                    settingsState.changeRunDictionary = onChanged!;
                  },
                  contentPadding: AppStyles.mainMardingHorizontalMini,
                  title: Text(
                    locale.saveLastBottomNavIndex,
                    style: AppStyles.mainTextStyle,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
