import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_word_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';

abstract class UserDictionaryWordRepository {
  Future<List<UserDictionaryWordEntity>> getAllWords();

  Future<List<UserDictionaryWordEntity>> getWordById({required int wordId});

  Future<List<UserDictionaryWordEntity>> getWordsByCategoryId({required int categoryId});

  Future<int> addWord({required UserDictionaryAddWordEntity model});

  Future<int> changeWord({required UserDictionaryChangeWordEntity model});

  Future<int> deleteWord({required int wordId});

  Future<int> deleteWordsCategory({required int categoryId});
}