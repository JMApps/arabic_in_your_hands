import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';

abstract class WordsRepository {
  Future<List<WordEntity>> getAllWords();

  Future<WordEntity> getWordById({required int wordId});

  Future<List<WordEntity>> searchWord({required String word});
}