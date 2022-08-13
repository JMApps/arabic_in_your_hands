import 'package:arabicinyourhands/data/database/service/dictionary_database_query.dart';
import 'package:flutter/material.dart';

class DictionaryContentState with ChangeNotifier {

  final _dictionaryDatabaseQuery = DictionaryDatabaseQuery();

  DictionaryDatabaseQuery get getDictionaryDatabaseQuery => DictionaryDatabaseQuery();

  createWordCategory(String wordCategoryTitle, String wordCategoryColor, int priority) {
    _dictionaryDatabaseQuery.createWordCategory(wordCategoryTitle, wordCategoryColor, priority);
    notifyListeners();
  }

  updateWordCategory(int categoryId, String wordCategoryTitle, String wordCategoryColor, int priority) {
    _dictionaryDatabaseQuery.updateWordCategory(categoryId, wordCategoryTitle, wordCategoryColor, priority);
    notifyListeners();
  }

  deleteWordCategory(int categoryId) {
    _dictionaryDatabaseQuery.deleteWordCategory(categoryId);
    notifyListeners();
  }

  @override
  void dispose() {
    _dictionaryDatabaseQuery.con.closeDB();
    super.dispose();
  }
}