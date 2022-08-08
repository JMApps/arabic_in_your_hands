import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogVisibility extends StatelessWidget {
  const DialogVisibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              const Divider(
                indent: 24,
                endIndent: 24,
                color: Color(0xFF243743),
              ),
              SwitchListTile.adaptive(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  'Показать/скрыть арабский текст',
                  style: TextStyle(fontSize: 18),
                ),
                activeColor: const Color(0xFF006D50),
                value: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateSecondVisibilityState(value!);
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
                color: Color(0xFF243743),
              ),
              SwitchListTile.adaptive(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  'Показать/скрыть текст перевода',
                  style: TextStyle(fontSize: 18),
                ),
                activeColor: const Color(0xFF006D50),
                value: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateFirstVisibilityState(value!);
                },
              ),
              const Divider(
                indent: 24,
                endIndent: 24,
                color: Color(0xFF243743),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
