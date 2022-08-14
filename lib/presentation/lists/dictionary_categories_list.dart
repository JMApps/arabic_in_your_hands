import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/presentation/items/dictionary_categories_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DictionaryCategoriesList extends StatelessWidget {
  const DictionaryCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<DictionaryContentState>().getDictionaryDatabaseQuery.getAllCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return DictionaryCategoriesItem(
                      item: snapshot.data![index],
                    );
                  },
                ),
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Добавьте первую категорию',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
      },
    );
  }
}
