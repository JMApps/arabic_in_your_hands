import 'package:arabicinyourhands/domain/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentSettings extends StatelessWidget {
  const ContentSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getReadSettings = context.read<ContentSettingsState>();
    final getWatchSettings = context.watch<ContentSettingsState>();
    return CupertinoScrollbar(
      child: ListView(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(
              right: 16,
              top: 16,
              left: 16,
            ),
            leading: Icon(
              CupertinoIcons.textformat_size,
              color: myColor.myAccentColor,
            ),
            title: const Text(
              'Размер арабского текста',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Slider.adaptive(
                    activeColor: myColor.myAccentColor,
                    min: 14,
                    max: 60,
                    value: getWatchSettings.getArabicTextSize,
                    onChanged: (sizeValue) {
                      getReadSettings.changeTextArabicSize(sizeValue);
                    },
                    onChangeEnd: (onChangedEnd) {
                      // Сохранить значения
                    },
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 75,
                  child: Text(
                      getWatchSettings.getArabicTextSize.toInt().toString()),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              right: 16,
              top: 16,
              left: 16,
            ),
            leading: Icon(
              CupertinoIcons.textformat_size,
              color: myColor.myAccentColor,
            ),
            title: const Text(
              'Размер текста перевода',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Slider.adaptive(
                    activeColor: myColor.myAccentColor,
                    min: 14,
                    max: 60,
                    value: getWatchSettings.getTranslationTextSize,
                    onChanged: (sizeValue) {
                      getReadSettings.changeTextTranslationSize(sizeValue);
                    },
                    onChangeEnd: (onChangedEnd) {
                      // Сохранить значение
                    },
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 75,
                  child: Text(getWatchSettings.getTranslationTextSize
                      .toInt()
                      .toString()),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              right: 16,
              top: 16,
              left: 16,
            ),
            leading: Icon(
              Icons.font_download_rounded,
              color: myColor.myAccentColor,
            ),
            title: const Text(
              'Шрифт арабского текста',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  activeColor: myColor.myAccentColor,
                  value: 0,
                  groupValue: getWatchSettings.getArabicFontIndex,
                  onChanged: (onChanged) {
                    getReadSettings.changeArabicFontIndex(0);
                  },
                ),
                Radio(
                  activeColor: myColor.myAccentColor,
                  value: 1,
                  groupValue: getWatchSettings.getArabicFontIndex,
                  onChanged: (onChanged) {
                    getReadSettings.changeArabicFontIndex(1);
                  },
                ),
                Radio(
                  activeColor: myColor.myAccentColor,
                  value: 2,
                  groupValue: getWatchSettings.getArabicFontIndex,
                  onChanged: (onChanged) {
                    getReadSettings.changeArabicFontIndex(2);
                  },
                ),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              right: 16,
              top: 16,
              left: 16,
            ),
            leading: Icon(
              Icons.font_download_rounded,
              color: myColor.myAccentColor,
            ),
            title: const Text(
              'Шрифт текста перевода',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  activeColor: myColor.myAccentColor,
                  value: getWatchSettings.getTranslationFontIndex,
                  groupValue: 0,
                  onChanged: (onChanged) {
                    getReadSettings.changeTranslationFontIndex(0);
                  },
                ),
                Radio(
                  activeColor: myColor.myAccentColor,
                  value: getWatchSettings.getTranslationFontIndex,
                  groupValue: 1,
                  onChanged: (onChanged) {
                    getReadSettings.changeTranslationFontIndex(1);
                  },
                ),
                Radio(
                  activeColor: myColor.myAccentColor,
                  value: getWatchSettings.getTranslationFontIndex,
                  groupValue: 2,
                  onChanged: (onChanged) {
                    getReadSettings.changeTranslationFontIndex(2);
                  },
                ),
              ],
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              right: 16,
              top: 16,
              left: 16,
            ),
            leading: Icon(
              CupertinoIcons.text_alignleft,
              color: myColor.myAccentColor,
            ),
            title: const Text(
              'Расположение текста',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(16),
              child: ToggleButtons(
                color: myColor.myAccentColor,
                borderRadius: BorderRadius.circular(15),
                isSelected: getWatchSettings.getIsTextAlignSelected,
                onPressed: (int index) {
                  getReadSettings.changeTextAlign(index);
                },
                children: const [
                  Icon(CupertinoIcons.text_alignleft),
                  Icon(CupertinoIcons.text_aligncenter),
                  Icon(CupertinoIcons.text_alignright),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          SwitchListTile.adaptive(
            activeColor: myColor.myAccentColor,
            title: const Text(
              'Не отключать дисплей',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'Дисплей будет включен пока приложение активно',
            ),
            value: getWatchSettings.getWakeLockState,
            onChanged: (onChanged) {
              getReadSettings.changeWakeLockState(onChanged);
            },
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          SwitchListTile.adaptive(
            activeColor: myColor.myAccentColor,
            title: const Text(
              'Адаптивная тема',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
                'Тема приложения будет соответствовать теме на устройстве'),
            value: getWatchSettings.getThemeIsAdaptive,
            onChanged: (onChanged) {
              getReadSettings.changeThemeAdaptiveState(onChanged);
            },
          ),
          SwitchListTile.adaptive(
            activeColor: myColor.myAccentColor,
            title: const Text(
              'Пользовательская тема',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
                'Тема приложения будет соответствовать выбранной вами'),
            value: getWatchSettings.getThemeIsUser,
            onChanged: getWatchSettings.getThemeIsAdaptive
                ? null
                : (onChanged) {
                    getReadSettings.changeThemeUserState(onChanged);
                  },
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
        ],
      ),
    );
  }
}
