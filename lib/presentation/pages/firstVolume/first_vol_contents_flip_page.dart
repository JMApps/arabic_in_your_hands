import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/lists/first_vol_content_flip_list.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolContentsFlipPage extends StatelessWidget {
  const FirstVolContentsFlipPage({
    super.key,
    required this.firstVolSubChapterEntity,
  });

  final FirstVolSubChapterEntity firstVolSubChapterEntity;

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
          title: Text(firstVolSubChapterEntity.dialogTitle),
          backgroundColor: appColors.primaryColor,
          actions: [
            Consumer<ContentFlipState>(
              builder: (BuildContext context, flipState, Widget? child) {
                return IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_2_circlepath,
                    color: Colors.white,
                  ),
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
              shape: AppStyles.mainShape,
              color: appColors.inversePrimary,
              child: Padding(
                padding: AppStyles.mainMarding,
                child: Text(
                  firstVolSubChapterEntity.dialogSubTitle,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: FirstVolContentFlipList(
                firstSubChapterId: firstVolSubChapterEntity.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
