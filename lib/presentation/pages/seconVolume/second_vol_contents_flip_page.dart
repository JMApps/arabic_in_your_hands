import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/lists/second_vol_content_flip_list.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolContentsFlipPage extends StatelessWidget {
  const SecondVolContentsFlipPage({
    super.key,
    required this.secondVolSubChapterEntity,
  });

  final SecondVolSubChapterEntity secondVolSubChapterEntity;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentFlipState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(secondVolSubChapterEntity.dialogTitle),
          backgroundColor: appColors.primaryColor,
          actions: [
            Consumer<ContentFlipState>(
              builder: (BuildContext context, flipState, _) {
                return IconButton(
                  icon: Icon(flipState.getCardSideMode ? CupertinoIcons.rotate_right : CupertinoIcons.rotate_left),
                  onPressed: () {
                    flipState.changeFlipSide();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: AppStyles.mainMardingMini,
              color: appColors.secondary,
              child: Padding(
                padding: AppStyles.mainMarding,
                child: Text(
                  secondVolSubChapterEntity.dialogSubTitle,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: SecondVolContentFlipList(
                secondSubChapterId: secondVolSubChapterEntity.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
