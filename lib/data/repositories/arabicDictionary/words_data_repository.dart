import 'package:arabicinyourhands/data/datasources/services/database_arabic_dictionary_service.dart';
import 'package:arabicinyourhands/data/models/arabicDictionary/word_model.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/words_repository.dart';
import 'package:sqflite/sqflite.dart';

class WordsDataReposioty implements WordsRepository {
  final DatabaseArabicDictionaryService _arabicDictionaryService = DatabaseArabicDictionaryService();

  static final WordsDataReposioty _instance = WordsDataReposioty._internal();

  WordsDataReposioty._internal();

  static WordsDataReposioty getInstance() {
    return _instance;
  }

  @override
  Future<List<WordEntity>> getAllWords() async {
    final Database database = await _arabicDictionaryService.db;
    final List<Map<String, Object?>> resources = await database.query('words');
    final List<WordEntity> words = resources.isNotEmpty ? resources.map((c) => _mapToEntity(WordModel.fromMap(c))).toList() : [];
    return words;
  }

  @override
  Future<WordEntity> getWordById({required int wordId}) async {
    final Database database = await _arabicDictionaryService.db;
    final List<Map<String, Object?>> resources = await database.query('words', where: 'id = $wordId');
    final WordEntity? wordById = resources.isNotEmpty ? _mapToEntity(WordModel.fromMap(resources.first)) : null;
    return wordById!;
  }

  @override
  Future<List<WordEntity>> searchWord({required String word}) async {
    final Database database = await _arabicDictionaryService.db;
    final List<Map<String, Object?>> resources = await database.query('words', where: 'word LIKE ?', whereArgs: ['%$word%'],);
    final List<WordEntity> searchResults = resources.isNotEmpty ? resources.map((c) => _mapToEntity(WordModel.fromMap(c))).toList() : [];
    return searchResults;
  }

  // Mapping to entity
  WordEntity _mapToEntity(WordModel model) {
    return WordEntity(
      id: model.id,
      word: model.word,
      shortMeaning: model.shortMeaning,
      meaning: model.meaning,
      root: model.root,
      plural: model.plural,
      species: model.species,
      other: model.other,
    );
  }
}
