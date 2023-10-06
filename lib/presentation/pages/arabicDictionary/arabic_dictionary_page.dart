import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/search_words_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArabicDictionaryPage extends StatelessWidget {
  const ArabicDictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale!.arabicDictionary),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchWordsDelegate(hintText: 'Поиск слов...'));
            },
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: Container(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: appColors.secondary,
      //   onPressed: () {},
      //   child: const Icon(CupertinoIcons.add),
      // ),
    );
  }
}
