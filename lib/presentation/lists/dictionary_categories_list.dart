import 'package:arabicinyourhands/data/database/service/dictionary_database_query.dart';
import 'package:arabicinyourhands/presentation/items/dictionary_categories_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryCategoriesList extends StatelessWidget {
  DictionaryCategoriesList({Key? key}) : super(key: key);

  final _dictionaryDatabaseQuery = DictionaryDatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _dictionaryDatabaseQuery.getAllCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasError
            ? Center(
                child: Text('${snapshot.error}'),
              )
            : snapshot.hasData
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
                    child: CircularProgressIndicator(),
                  );
      },
    );
  }
}
