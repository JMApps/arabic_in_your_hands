import 'package:arabicinyourhands/data/datasources/services/database_user_dictionary_service.dart';
import 'package:arabicinyourhands/data/models/userDictionary/user_dictionary_category_model.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_category_entity.dart';
import 'package:arabicinyourhands/domain/repositories/userDictionary/user_dictionary_category_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserDictionaryCategoryDataRepository implements UserDictionaryCategoryRepository {
  final DatabaseUserDictionaryService _databaseUserDictionaryService = DatabaseUserDictionaryService();

  @override
  Future<List<UserDictionaryCategoryEntity>> getAllCategories() async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final List<Map<String, Object?>> resours = await dbClient.query('Table_of_word_categories', orderBy: 'priority DESC');
    List<UserDictionaryCategoryEntity>? wordCaterories = resours.isNotEmpty ? resours.map((c) => _mapToEntity(UserDictionaryCategoryModel.fromMap(c))).toList() : [];
    return wordCaterories;
  }

  @override
  Future<UserDictionaryCategoryEntity> getCategoryById({required int categoryId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final List<Map<String, Object?>> resours = await dbClient.query('Table_of_word_categories', where: '_id = $categoryId');
    final UserDictionaryCategoryEntity? categoryByid = resours.isNotEmpty ? _mapToEntity(UserDictionaryCategoryModel.fromMap(resours.first)) : null;
    return categoryByid!;
  }

  @override
  Future<int> addCategory({required UserDictionaryAddCategoryEntity model}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final Map<String, dynamic> category = {
      'wordCategoryTitle': model.wordCategoryTitle,
      'wordCategoryColor': model.wordCategoryColor,
      'priority': model.priority,
      'addDateTime': DateTime.now().toString(),
      'changeDateTime': DateTime.now().toString(),
    };
    final int wordCategory = await dbClient.insert('Table_of_word_categories', category, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return wordCategory;
  }

  @override
  Future<int> changeCategory({required UserDictionaryChangeCategoryEntity model}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final Map<String, dynamic> newCategory = {
      '_id': model.id,
      'wordCategoryTitle': model.wordCategoryTitle,
      'wordCategoryColor': model.wordCategoryColor,
      'priority': model.priority,
      'changeDateTime': DateTime.now().toString(),
    };
    final int newWordCategory = await dbClient.update('Table_of_word_categories', newCategory, conflictAlgorithm: sql.ConflictAlgorithm.replace, where: '_id = ${model.id}');
    return newWordCategory;
  }

  @override
  Future<int> deleteCategory({required int categoryId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final int deleteCategory = await dbClient.delete('Table_of_word_categories', where: '_id == $categoryId');
    await dbClient.delete('Table_of_words', where: 'displayBy == $categoryId');
    return deleteCategory;
  }

  @override
  Future<int> deleteAllCategories() async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final int deleteAllCategories = await dbClient.delete('Table_of_word_categories');
    await dbClient.delete('Table_of_words');
    return deleteAllCategories;
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
