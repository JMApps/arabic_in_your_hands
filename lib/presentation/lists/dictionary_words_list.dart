import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/presentation/items/dictionary_word_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DictionaryWordsList extends StatelessWidget {
  const DictionaryWordsList({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<DictionaryContentState>().getDictionaryDatabaseQuery.getWordsCategory(categoryId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return DictionaryWordItem(
                      item: snapshot.data![index],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.5,
                    mainAxisSpacing: 1.5,
                  ),
                ),
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Добавьте первое слово',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
