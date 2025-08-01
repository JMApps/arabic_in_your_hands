import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/lists/words_flip_card_list.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/add_word_popup.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class WordsContentFlipModePage extends StatelessWidget {
  const WordsContentFlipModePage({
    super.key,
    required this.categoryModel,
  });

  final UserDictionaryCategoryEntity categoryModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContentFlipState>(
          create: (_) => ContentFlipState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale!.flipCardMode),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.add_circled),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return AnimatedPadding(
                      padding: MediaQuery.of(context).viewInsets,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.decelerate,
                      child: AddWordPopup(
                        categoryId: categoryModel.id,
                        categoryPriority: categoryModel.priority,
                      ),
                    );
                  },
                );
              },
            ),
            Consumer<ContentFlipState>(
              builder: (context, flipMode, _) {
                return IconButton(
                  icon: Icon(
                    flipMode.getCardSideMode
                        ? CupertinoIcons.rotate_right
                        : CupertinoIcons.rotate_left,
                  ),
                  onPressed: () {
                    flipMode.changeFlipSide();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: AppStyles.mainMardingMini,
              padding: AppStyles.mainMardingMini,
              decoration: BoxDecoration(
                color: appColors.secondary,
                borderRadius: AppStyles.mainBorder,
              ),
              child: Text(
                categoryModel.wordCategoryTitle,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: WordsFlipCardList(
                wordsCategoryId: categoryModel.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
