import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/words_repository.dart';

class WordsUseCase {
  final WordsRepository _wordsRepository;

  WordsUseCase(this._wordsRepository);

  Future<List<WordEntity>> fetchAllWords() async {
    try {
      final List<WordEntity> allWords = await _wordsRepository.getAllWords();
      return allWords;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<WordEntity> fetchWordById({required int wordId}) async {
    try {
      final WordEntity wordById = await _wordsRepository.getWordById(wordId: wordId);
      return wordById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<WordEntity>> fetchSearchWord({required String word}) async {
    try {
      final List<WordEntity> searchWord = await _wordsRepository.searchWord(word: word);
      return searchWord;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}