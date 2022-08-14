import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/lists/dictionary_words_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryWordsPage extends StatelessWidget {
  const DictionaryWordsPage({
    Key? key,
    required this.categoryId,
    required this.categoryTitle,
  }) : super(key: key);

  final int categoryId;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              floating: true,
              snap: false,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: 50,
              title: const Text('Слова'),
            ),
            SliverToBoxAdapter(
              child: Card(
                color: Theme.of(context).colorScheme.myAccentColor,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    categoryTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Gilroy medium',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          child: CupertinoScrollbar(
            child: DictionaryWordsList(
              categoryId: categoryId,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Theme.of(context).colorScheme.fabDictionaryColor,
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: AnimatedPadding(
                  padding: MediaQuery.of(context).viewInsets,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.decelerate,
                  child: const SizedBox(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
