import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_word_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_words_use_case.dart';
import 'package:flutter/material.dart';

class UserDictionaryWordState extends ChangeNotifier {
  final UserDictionaryWordsUseCase _wordsUseCase = UserDictionaryWordsUseCase(
    UserDictionaryWordDataRepository(),
  );

  Future<List<UserDictionaryWordEntity>> fetchAllWords() async {
    final Future<List<UserDictionaryWordEntity>> allWords = _wordsUseCase.fetchAllWords();
    return allWords;
  }

  Future<UserDictionaryWordEntity> fetchWordById({required int wordId}) async {
    final Future<UserDictionaryWordEntity> wordById = _wordsUseCase.fetchWordById(wordId: wordId);
    return wordById;
  }

  Future<List<UserDictionaryWordEntity>> fetchWordByCategoryId({required int categoryId}) async {
    final Future<List<UserDictionaryWordEntity>> wordById = _wordsUseCase.fetchCategoryWords(categoryId: categoryId);
    return wordById;
  }

  Future<int> addWord({required UserDictionaryAddWordEntity model}) async {
    final int wordEntity = await _wordsUseCase.addWord(model: model);
    notifyListeners();
    return wordEntity;
  }

  Future<int> changeWord(
      {required UserDictionaryChangeWordEntity model}) async {
    final int wordEntity = await _wordsUseCase.changeWord(model: model);
    notifyListeners();
    return wordEntity;
  }

  Future<int> deleteWord({required int wordId}) async {
    final int wordEntity = await _wordsUseCase.deleteWord(wordId: wordId);
    notifyListeners();
    return wordEntity;
  }

  Future<int> deleteWordsCategory({required int categoryId}) async {
    final int wordEntity =
        await _wordsUseCase.deleteWordsCategory(categoryId: categoryId);
    notifyListeners();
    return wordEntity;
  }
}
