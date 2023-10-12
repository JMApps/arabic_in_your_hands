import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/domain/repositories/userDictionary/user_dictionary_word_repository.dart';

class UserDictionaryWordsUseCase {

  final UserDictionaryWordRepository _userDictionaryWordRepository;

  UserDictionaryWordsUseCase(this._userDictionaryWordRepository);

  Future<List<UserDictionaryWordEntity>> fetchAllWords() async {
    try {
      final List<UserDictionaryWordEntity> allWords = await _userDictionaryWordRepository.getAllWords();
      return allWords;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserDictionaryWordEntity> fetchWordById({required int wordId}) async {
      try {
        final UserDictionaryWordEntity allWords = await _userDictionaryWordRepository.getWordById(wordId: wordId);
        return allWords;
      } catch (e) {
        throw Exception(e.toString());
      }
    }

  Future<List<UserDictionaryWordEntity>> fetchCategoryWords({required int categoryId}) async {
    try {
      final List<UserDictionaryWordEntity> categoryWords = await _userDictionaryWordRepository.getWordsByCategoryId(categoryId: categoryId);
      return categoryWords;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> addWord({required UserDictionaryAddWordEntity model}) async {
    try {
      final int wordEntity = await _userDictionaryWordRepository.addWord(model: model);
      return wordEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> changeWord({required UserDictionaryChangeWordEntity model}) async {
    try {
      final int wordEntity = await _userDictionaryWordRepository.changeWord(model: model);
      return wordEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteWord({required int wordId}) async {
    try {
      final int wordEntity = await _userDictionaryWordRepository.deleteWord(wordId: wordId);
      return wordEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteWordsCategory({required int categoryId}) async {
    try {
      final int wordEntity = await _userDictionaryWordRepository.deleteWordsCategory(categoryId: categoryId);
      return wordEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}