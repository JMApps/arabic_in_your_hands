import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';

abstract class WordsCollectionRepository {
  Future<List<WordEntity>> getWordsByCollectionId({required int collectionId});

  Future<WordEntity> getWordById({required int wordId});

  Future<int> addWordToCollection({required WordEntity word, required int collectionId});

  Future<int> deleteWordFromCollection({required int wordId});

  Future<int> deleteAllWordsFromCollection({required int collectionId});
}