import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/data/database/service/database_helper_dictionary.dart';

class DictionaryDatabaseQuery {
  DatabaseHelperDictionary con = DatabaseHelperDictionary();

  Future<List<DictionaryCategoryModel>> getAllCategories() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_word_categories');
    List<DictionaryCategoryModel>? categories = res.isNotEmpty ? res.map((c) => DictionaryCategoryModel.fromMap(c)).toList() : null;
    return categories!;
  }

  addCategory() async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_word_categories SET wordCategoryTitle = 0 WHERE _id == 1');
  }
}