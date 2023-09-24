import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/presentation/uiState/dialog_show_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DialogVisibility extends StatelessWidget {
  const DialogVisibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final DialogShowState dialogShowState = Provider.of<DialogShowState>(context);
    return Container(
      padding: AppStyles.mainMarding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale.visible_mode,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: appColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            shape: AppStyles.mainShape,
            contentPadding: AppStyles.mainMardingHorizontal,
            title: Text(
              locale.show_hide_arabic_text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            activeColor: appColors.secondary,
            value: dialogShowState.getDialogArabicIsShow,
            onChanged: (bool? value) {
              dialogShowState.changeArabicShowing();
            },
          ),
          SwitchListTile.adaptive(
            shape: AppStyles.mainShape,
            contentPadding: AppStyles.mainMardingHorizontal,
            title: Text(
              locale.show_hide_translation_text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            activeColor: appColors.secondary,
            value: dialogShowState.getDialogTranslationIsShow,
            onChanged: (bool? value) {
              dialogShowState.changeTranslationShowing();
            },
          ),
        ],
      ),
    );
  }
}
