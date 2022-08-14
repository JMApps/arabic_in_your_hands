import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/data/database/service/database_helper_dictionary.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DictionaryDatabaseQuery {
  DatabaseHelperDictionary con = DatabaseHelperDictionary();

  Future<List<DictionaryCategoryModel>> getAllCategories() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_word_categories');
    List<DictionaryCategoryModel>? categories = res.isNotEmpty ? res.map((c) => DictionaryCategoryModel.fromMap(c)).toList() : null;
    return categories!;
  }

  Future<int> createWordCategory(String wordCategoryTitle, String wordCategoryColor, int priority) async {
    var dbClient = await con.db;
    final wordCategoryData = {'wordCategoryTitle': wordCategoryTitle, 'wordCategoryColor': wordCategoryColor, 'priority': priority, 'addDateTime': DateTime.now().toString(), 'changeDateTime': DateTime.now().toString()};
    return await dbClient.insert('Table_of_word_categories', wordCategoryData, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<int> updateWordCategory(int categoryId, String wordCategoryTitle, String wordCategoryColor, int priority) async {
    var dbClient = await con.db;
    final wordCategoryData = {'wordCategoryTitle': wordCategoryTitle, 'wordCategoryColor': wordCategoryColor, 'priority': priority, 'changeDateTime': DateTime.now().toString()};
    return await dbClient.update('Table_of_word_categories', wordCategoryData, conflictAlgorithm: sql.ConflictAlgorithm.replace, where: '_id == $categoryId');
  }

  Future<int> deleteWordCategory(int categoryId) async {
    var dbClient = await con.db;
    var res = await dbClient.delete('Table_of_word_categories', where: '_id == $categoryId');
    res = await dbClient.delete('Table_of_words', where: 'displayBy == $categoryId');
    return res;
  }

  Future<List<DictionaryWordModel>> getWordsCategory(int categoryId) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_words', where: 'displayBy == $categoryId');
    List<DictionaryWordModel>? words = res.isNotEmpty ? res.map((c) => DictionaryWordModel.fromMap(c)).toList() : null;
    return words!;
  }
}