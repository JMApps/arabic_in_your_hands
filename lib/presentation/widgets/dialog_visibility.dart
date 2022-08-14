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
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Режим отображения',
                style: TextStyle(fontSize: 18),
              ),
              Divider(
                indent: 24,
                endIndent: 24,
                color: myColor.myPrimaryColor,
              ),
              SwitchListTile.adaptive(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  'Показать/скрыть арабский текст',
                  style: TextStyle(fontSize: 18),
                ),
                activeColor: myColor.myAccentColor,
                value: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateSecondVisibilityState(value!);
                },
              ),
              Divider(
                indent: 16,
                endIndent: 16,
                color: myColor.myPrimaryColor,
              ),
              SwitchListTile.adaptive(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
              Divider(
                indent: 24,
                endIndent: 24,
                color: myColor.myPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
