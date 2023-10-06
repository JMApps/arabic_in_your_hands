import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/dialog_visibility.dart';
import 'package:arabicinyourhands/presentation/widgets/play_speed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPlayerContaier extends StatelessWidget {
  const ContentPlayerContaier({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    //final ContentPlayerState playerState = Provider.of<ContentPlayerState>(context);
    return Container(
      padding: AppStyles.mainMardingMini,
      color: appColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.small(
            backgroundColor: appColors.mainCardColor,
            elevation: 0,
            heroTag: 'media_1',
            child: const Icon(CupertinoIcons.eye_fill),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const DialogVisibility();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.arrow_2_squarepath,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.secondary,
            elevation: 0,
            heroTag: 'media_1',
            child: const Icon(
              CupertinoIcons.backward_end,
            ),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.secondary,
            elevation: 0,
            heroTag: 'media_2',
            child: const Icon(CupertinoIcons.play),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.secondary,
            elevation: 0,
            heroTag: 'media_3',
            child: const Icon(
              CupertinoIcons.forward_end,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.arrow_counterclockwise,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            backgroundColor: appColors.mainCardColor,
            elevation: 0,
            heroTag: 'media_4',
            child: const Icon(
              CupertinoIcons.speedometer,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const PlaySpeed();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
