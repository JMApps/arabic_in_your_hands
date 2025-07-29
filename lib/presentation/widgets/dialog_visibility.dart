import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/presentation/uiState/dialog_show_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class DialogVisibility extends StatelessWidget {
  const DialogVisibility({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? locale = AppLocalizations.of(context);
    final DialogShowState dialogShowState = Provider.of<DialogShowState>(context);
    return Container(
      padding: AppStyles.mainMardingWithoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale!.visibleMode,
            style: TextStyle(
              fontSize: 20,
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
              locale.arabicText,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            activeColor: appColors.secondary,
            value: dialogShowState.getDialogArabicIsShow,
            onChanged: (bool value) {
              dialogShowState.changeArabicShowing;
            },
          ),
          SwitchListTile.adaptive(
            shape: AppStyles.mainShape,
            contentPadding: AppStyles.mainMardingHorizontal,
            title: Text(
              locale.translationText,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            activeColor: appColors.secondary,
            value: dialogShowState.getDialogTranslationIsShow,
            onChanged: (bool value) {
              dialogShowState.changeTranslationShowing;
            },
          ),
        ],
      ),
    );
  }
}

