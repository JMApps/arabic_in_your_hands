import 'package:arabicinyourhands/data/database/service/dictionary_database_query.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
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
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
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
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return const Text('Add category');
            },
          );
        },
      ),
    );
  }
}
