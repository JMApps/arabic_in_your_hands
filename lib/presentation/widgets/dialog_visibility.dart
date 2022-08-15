import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogVisibility extends StatelessWidget {
  const DialogVisibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      color: myColor.mainChapterCardColor,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 16),
            width: double.maxFinite,
            child: Text(
              'Режим отобраэения',
              style: TextStyle(
                fontSize: 18,
                color: myColor.myAccentColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SwitchListTile.adaptive(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: const Text(
              'Показать/скрыть арабский текст',
              style: TextStyle(fontSize: 18),
            ),
            activeColor: myColor.myAccentColor,
            value: context
                .watch<VolumeContentDialogVisibilityState>()
                .getSecondDialogVisibility,
            onChanged: (bool? value) {
              context
                  .read<VolumeContentDialogVisibilityState>()
                  .updateSecondVisibilityState(value!);
            },
          ),
          SwitchListTile.adaptive(
            contentPadding: const EdgeInsets.only(
              right: 24,
              bottom: 16,
              left: 24,
            ),
            title: const Text(
              'Показать/скрыть текст перевода',
              style: TextStyle(fontSize: 18),
            ),
            activeColor: myColor.myAccentColor,
            value: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
            onChanged: (bool? value) {
              context.read<VolumeContentDialogVisibilityState>().updateFirstVisibilityState(value!);
            },
          ),
        ],
      ),
    );
  }
}
