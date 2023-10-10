import 'package:arabicinyourhands/data/datasources/services/database_collections_service.dart';
import 'package:arabicinyourhands/data/models/arabicDictionary/word_model.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/words_collection_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class WordsCollectionDataReposioty implements WordsCollectionRepository {
  final DatabaseCollectionsService _databaseCollectionsService = DatabaseCollectionsService();

  @override
  Future<List<WordEntity>> getWordsByCollectionId({required int collectionId}) async {
    final Database database = await _databaseCollectionsService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_words_collections', where: 'display_by = $collectionId');
    final List<WordEntity> wordByCollection = resources.isNotEmpty ? resources.map((c) => _mapToEntity(WordModel.fromMap(c))).toList() : [];
    return wordByCollection;
  }

  @override
  Future<WordEntity> getWordById({required int wordId}) async {
    final Database database = await _databaseCollectionsService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_words_collections', where: 'id = $wordId');
    final WordEntity? wordById = resources.isNotEmpty ? _mapToEntity(WordModel.fromMap(resources.first)) : null;
    return wordById!;
  }

  @override
  Future<int> addWordToCollection({required WordEntity word, required int collectionId}) async {
    final Database database = await _databaseCollectionsService.db;
    final Map<String, dynamic> addword = {
      'id': word.id,
      'word': word.word,
      'short_meaning': word.shortMeaning,
      'meaning': word.meaning,
      'root': word.root,
      'plural': word.plural,
      'species': word.species,
      'other': word.other,
      'display_by': collectionId,
    };
    final int newWord = await database.insert('Table_of_words_collections', addword, conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    return newWord;
  }

  @override
  Future<int> deleteAllWordsFromCollection({required int collectionId}) async {
    final Database dbClient = await _databaseCollectionsService.db;
    final int deleteWord = await dbClient.delete('Table_of_words_collections', where: 'display_by = $collectionId');
    return deleteWord;
  }

  @override
  Future<int> deleteWordFromCollection({required int wordId}) async {
    final Database dbClient = await _databaseCollectionsService.db;
    final int deleteWord = await dbClient.delete('Table_of_words_collections', where: 'id = $wordId');
    return deleteWord;
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
