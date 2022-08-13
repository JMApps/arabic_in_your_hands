import 'package:arabicinyourhands/data/database/service/dictionary_database_query.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
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

  showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.myAccentColor,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Gilroy'
          ),
        ),
        duration: const Duration(milliseconds: 1250),
      ),
    );
  }

  @override
  void dispose() {
    _dictionaryDatabaseQuery.con.closeDB();
    super.dispose();
  }
}