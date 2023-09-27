import 'package:arabicinyourhands/data/datasources/services/database_user_dictionary_service.dart';
import 'package:arabicinyourhands/data/models/userDictionary/user_dictionary_category_model.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/repositories/userDictionary/user_dictionary_category_repository.dart';
import 'package:sqflite/sqflite.dart';

class UserDictionaryCategoryDataRepository
    extends UserDictionaryCategoryRepository {
  final DatabaseUserDictionaryService _databaseUserDictionaryService = DatabaseUserDictionaryService();

  static final UserDictionaryCategoryDataRepository _instance = UserDictionaryCategoryDataRepository._internal();

  UserDictionaryCategoryDataRepository._internal();

  static UserDictionaryCategoryDataRepository getInstance() {
    return _instance;
  }

  @override
  Future<List<UserDictionaryCategoryEntity>> getAllCategories() async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    var res = await dbClient.query('Table_of_word_categories');
    List<UserDictionaryCategoryEntity>? wordCaterories = res.isNotEmpty ? res.map((c) => _mapToEntity(UserDictionaryCategoryModel.fromMap(c))).toList() : [];
    return wordCaterories;
  }

  @override
  Future<List<UserDictionaryCategoryEntity>> getCategoryById({required int categoryId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    var res = await dbClient.query('Table_of_word_categories', where: 'id = $categoryId');
    List<UserDictionaryCategoryEntity>? wordCaterories = res.isNotEmpty ? res.map((c) => _mapToEntity(UserDictionaryCategoryModel.fromMap(c))).toList() : [];
    return wordCaterories;
  }

  // Mapping to entity
  UserDictionaryCategoryEntity _mapToEntity(UserDictionaryCategoryModel model) {
    return UserDictionaryCategoryEntity(
      id: model.id,
      wordCategoryTitle: model.wordCategoryTitle,
      wordCategoryColor: model.wordCategoryColor,
      priority: model.priority,
      addDateTime: model.addDateTime,
      changeDateTime: model.changeDateTime,
    );
  }
}
