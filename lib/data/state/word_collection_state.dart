import 'package:arabicinyourhands/data/repositories/arabicDictionary/words_collection_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/words_collection_use_case.dart';
import 'package:flutter/material.dart';

class WordCollectionState extends ChangeNotifier {
  final WordsCollectionUseCase _wordsCollectionUseCase = WordsCollectionUseCase(WordsCollectionDataReposioty());

  Future<List<WordEntity>> fetchWordsByCollectionId({required int collectionId}) async {
    final Future<List<WordEntity>> wordsByCollection = _wordsCollectionUseCase.fetchWordsByCollectionId(collectionId: collectionId);
    notifyListeners();
    return wordsByCollection;
  }

  Future<WordEntity> fetchWordById({required int wordId}) async {
    final Future<WordEntity> wordById = _wordsCollectionUseCase.fetchWordById(wordId: wordId);
    notifyListeners();
    return wordById;
  }

  Future<int> addWordToCollection({required WordEntity word, required int collectionId}) async {
    final int addWordToCollection = await _wordsCollectionUseCase.addWordToCollection(word: word, collectionId: collectionId);
    notifyListeners();
    return addWordToCollection;
  }

  Future<int> deleteAllWordsFromCollection({required int collectionId}) async {
    final int deleteAllWords = await _wordsCollectionUseCase.deleteAllWordsFromCollection(collectionId: collectionId);
    notifyListeners();
    return deleteAllWords;
  }

  Future<int> deleteWordFromCollection({required int wordId}) async {
    final int changeCollection = await _wordsCollectionUseCase.deleteWordFromCollection(wordId: wordId);
    notifyListeners();
    return changeCollection;
  }
}
