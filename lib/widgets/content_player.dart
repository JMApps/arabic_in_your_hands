import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentPlayer extends StatelessWidget {
  const ContentPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: const Color(0xFF1F8D6E),
                value: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                onChanged: (value) {
                  context.read<VolumeContentDialogVisibilityState>().updateFirstVisibilityState(value);
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: Color(0xFF37FFC2),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_turn_up_left,
                color: Color(0xFF37FFC2),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.play_arrow,
                size: 35,
                color: Color(0xFF37FFC2),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_turn_up_right,
                color: Color(0xFF37FFC2),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_3_trianglepath,
                color: Color(0xFF37FFC2),
              ),
              onPressed: () {},
            ),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: const Color(0xFF1F8D6E),
                value: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                onChanged: (value) {
                  context.read<VolumeContentDialogVisibilityState>().updateSecondVisibilityState(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
