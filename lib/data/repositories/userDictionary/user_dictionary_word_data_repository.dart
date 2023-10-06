import 'package:arabicinyourhands/data/datasources/services/database_user_dictionary_service.dart';
import 'package:arabicinyourhands/data/models/userDictionary/user_dictionary_word_model.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/domain/repositories/userDictionary/user_dictionary_word_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserDictionaryWordDataRepository implements UserDictionaryWordRepository {
  final DatabaseUserDictionaryService _databaseUserDictionaryService = DatabaseUserDictionaryService();

  @override
  Future<List<UserDictionaryWordEntity>> getAllWords() async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final List<Map<String, Object?>> resours = await dbClient.query('Table_of_words');
    List<UserDictionaryWordEntity>? allWords = resours.isNotEmpty ? resours.map((c) => _mapToEntity(UserDictionaryWordModel.fromMap(c))).toList() : [];
    return allWords;
  }

  @override
  Future<List<UserDictionaryWordEntity>> getWordById({required int wordId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final List<Map<String, Object?>> resours = await dbClient.query('Table_of_words', where: '_id = $wordId');
    List<UserDictionaryWordEntity>? wordById = resours.isNotEmpty ? resours.map((c) => _mapToEntity(UserDictionaryWordModel.fromMap(c))).toList() : [];
    return wordById;
  }

  @override
  Future<List<UserDictionaryWordEntity>> getWordsByCategoryId({required int categoryId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final List<Map<String, Object?>> resours = await dbClient.query('Table_of_words', where: 'displayBy = $categoryId');
    List<UserDictionaryWordEntity>? categoryWords = resours.isNotEmpty ? resours.map((c) => _mapToEntity(UserDictionaryWordModel.fromMap(c))).toList() : [];
    return categoryWords;
  }

  @override
  Future<int> addWord({required UserDictionaryAddWordEntity model}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final Map<String, dynamic> word = {
      'displayBy': model.displayBy,
      'word': model.word,
      'wordTranscription': model.wordTranslate,
      'wordTranslate': model.wordTranslate,
      'wordItemColor': model.wordItemColor,
      'addDateTime': DateTime.now().toString(),
      'changeDateTime': DateTime.now().toString(),
      'priority': 0,
    };
    final int wordCategory = await dbClient.insert('Table_of_words', word, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return wordCategory;
  }

  @override
  Future<int> changeWord({required UserDictionaryChangeWordEntity model}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final Map<String, dynamic> newWord = {
      '_id': model.id,
      'word': model.word,
      'wordTranslate': model.wordTranslate,
      'wordItemColor': model.wordItemColor,
      'changeDateTime': DateTime.now().toString(),
    };
    final int newWordCategory = await dbClient.update('Table_of_words', newWord, conflictAlgorithm: sql.ConflictAlgorithm.replace, where: '_id = ${model.id}');
    return newWordCategory;
  }

  @override
  Future<int> deleteWord({required int wordId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final int deleteWord = await dbClient.delete('Table_of_words', where: '_id = $wordId');
    return deleteWord;
  }

  @override
  Future<int> deleteWordsCategory({required int categoryId}) async {
    final Database dbClient = await _databaseUserDictionaryService.db;
    final int deleteWordsCategory = await dbClient.delete('Table_of_words', where: 'displayBy = $categoryId');
    return deleteWordsCategory;
  }

  // Mapping to entity
  UserDictionaryWordEntity _mapToEntity(UserDictionaryWordModel model) {
    return UserDictionaryWordEntity(
      id: model.id,
      displayBy: model.displayBy,
      word: model.word,
      wordTranscription: model.wordTranscription,
      wordTranslate: model.wordTranslate,
      wordItemColor: model.wordItemColor,
      addDateTime: model.addDateTime,
      changeDateTime: model.changeDateTime,
      priority: model.priority,
    );
  }
}
