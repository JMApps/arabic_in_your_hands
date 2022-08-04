import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationSubChapterContent extends StatelessWidget {
  const BottomNavigationSubChapterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF243743),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                value: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateFirstVisibilityState(value!);
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: Colors.white,
              ),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.backward_end,
                color: Colors.white,
              ),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.play,
                color: Colors.white,
              ),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.forward_end,
                color: Colors.white,
              ),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_counterclockwise,
                color: Colors.white,
              ),
              splashRadius: 20,
            ),
            Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                value: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                onChanged: (bool? value) {
                  context.read<VolumeContentDialogVisibilityState>().updateSecondVisibilityState(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
