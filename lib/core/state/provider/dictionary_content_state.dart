import 'package:arabicinyourhands/data/database/service/dictionary_database_query.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
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

  createWord(int displayBy, String word, String wordTranslation, String wordColor, int priority) {
    _dictionaryDatabaseQuery.createWord(displayBy, word, wordTranslation, wordColor, priority);
    notifyListeners();
  }

  updateWord(int wordId, String word, String wordTranslation, String wordColor) {
    _dictionaryDatabaseQuery.updateWord(wordId, word, wordTranslation, wordColor);
    notifyListeners();
  }

  deleteWord(int wordId) {
    _dictionaryDatabaseQuery.deleteWord(wordId);
    notifyListeners();
  }

  showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        behavior: SnackBarBehavior.floating,
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