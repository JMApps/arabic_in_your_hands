import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsContentPage extends StatelessWidget {
  const SettingsContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
        backgroundColor: appColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainMarding,
        child: Consumer<ContentSettingsState>(
          builder: (context, settingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  locale.arabic_text_size,
                  style: AppStyles.mainTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appColors.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Text(
                      'Font 1',
                      style: AppStyles.mainTextStyle,
                    ),
                    1: Text(
                      'Font 2',
                      style: AppStyles.mainTextStyle,
                    ),
                    2: Text(
                      'Font 3',
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
                  locale.translation_text_size,
                  style: AppStyles.mainTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appColors.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Text(
                      'Font 1',
                      style: AppStyles.mainTextStyle,
                    ),
                    1: Text(
                      'Font 2',
                      style: AppStyles.mainTextStyle,
                    ),
                    2: Text(
                      'Font 3',
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
                  locale.text_align,
                  style: AppStyles.mainTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  thumbColor: appColors.inversePrimary,
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
                  locale.arabic_text_size,
                  style: AppStyles.mainTextStyle,
                ),
                Slider(
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
                  locale.translation_text_size,
                  style: AppStyles.mainTextStyle,
                ),
                Slider(
                  value: settingsState.getTranslationTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label:
                      settingsState.getTranslationTextSize.round().toString(),
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
                    locale.app_theme,
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
                    locale.user_app_theme,
                  ),
                ),
                SwitchListTile(
                  value: settingsState.getWakeLock,
                  onChanged: (bool? onChanged) {
                    settingsState.changeWakeLock = onChanged!;
                  },
                  contentPadding: AppStyles.mainMardingHorizontalMini,
                  title: Text(
                    locale.wake_lock_display,
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
