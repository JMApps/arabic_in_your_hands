import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';

abstract class WordsCollectionRepository {
  Future<List<WordEntity>> getWordsByCollectionId({required int collectionId});

  Future<int> addWordToCollection({required WordEntity word, required int collectionId});

  Future<int> removeWordFromCollection({required int wordId});
}