import 'package:arabicinyourhands/presentation/pages/arabicDictionary/lists/collections_list.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/add_collection_popup.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/search_words_delegate.dart';
import 'package:arabicinyourhands/presentation/widgets/main_app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArabicDictionaryPage extends StatelessWidget {
  const ArabicDictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final double appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, appBarHeight),
        child: GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchWordsDelegate(
                hintText: locale.searchWords,
              ),
            );
          },
          child: AppBar(
            title: Text(locale!.searchWords),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchWordsDelegate(
                      hintText: locale.searchWords,
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.search),
              ),
            ],
            leading: const MainAppIcon(),
          ),
        ),
      ),
      body: const CollectionsList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColors.secondary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              child: const AddCollectionPopup(),
            ),
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
