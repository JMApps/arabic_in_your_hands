import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/words_collection_repository.dart';

class WordsCollectionUseCase {
  final WordsCollectionRepository _wordsCollectionRepository;

  WordsCollectionUseCase(this._wordsCollectionRepository);

  Future<List<WordEntity>> fetchWordsByCollectionId({required int collectionId}) async {
    try {
      final List<WordEntity> wordsByColliection = await _wordsCollectionRepository.getWordsByCollectionId(collectionId: collectionId);
      return wordsByColliection;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<WordEntity> fetchWordById({required int wordId}) async {
    try {
      final WordEntity wordById = await _wordsCollectionRepository.getWordById(wordId: wordId);
      return wordById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> addWordToCollection({required WordEntity word, required int collectionId}) async {
    try {
      final int addWord = await _wordsCollectionRepository.addWordToCollection(word: word, collectionId: collectionId);
      return addWord;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteWordFromCollection({required int wordId}) async {
    try {
      final int removeWord = await _wordsCollectionRepository.deleteWordFromCollection(wordId: wordId);
      return removeWord;
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<int> deleteAllWordsFromCollection({required int collectionId}) async {
    try {
      final int removeWord = await _wordsCollectionRepository.deleteAllWordsFromCollection(collectionId: collectionId);
      return removeWord;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}