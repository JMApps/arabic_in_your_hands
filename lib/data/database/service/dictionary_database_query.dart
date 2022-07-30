import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';

import 'database_helper.dart';

class DictionaryDatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<DictionaryCategoryModel>> getAllCategories() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_word_categories');
    List<DictionaryCategoryModel>? categories = res.isNotEmpty ? res.map((c) => DictionaryCategoryModel.fromMap(c)).toList() : null;
    return categories!;
  }
}