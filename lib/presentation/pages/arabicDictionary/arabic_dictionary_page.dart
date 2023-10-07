import 'package:arabicinyourhands/presentation/pages/arabicDictionary/lists/collections_list.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/add_collection_popup.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/search_words_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArabicDictionaryPage extends StatelessWidget {
  const ArabicDictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale!.startSearch),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchWordsDelegate(
                  hintText: locale.startSearch,
                ),
              );
            },
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: const CollectionsList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColors.secondary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddCollectionPopup(),
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
