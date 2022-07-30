import 'package:arabicinyourhands/data/database/service/dictionary_database_query.dart';
import 'package:arabicinyourhands/widgets/add_cateogry_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dictionary extends StatelessWidget {
  Dictionary({Key? key}) : super(key: key);

  final _dictionaryDatabaseQuery = DictionaryDatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: _dictionaryDatabaseQuery.getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? snapshot.data == 'waiting'
                  ? const CircularProgressIndicator()
                  : Container()
              : Center(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'Добавьте первую категорию',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF243743),
                      ),
                    ),
                  ),
                );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: const Color(0xFF1F8D6E),
        child: const Icon(Icons.add),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return AddCategoryDialog();
            },
          );
        },
      ),
    );
  }
}
