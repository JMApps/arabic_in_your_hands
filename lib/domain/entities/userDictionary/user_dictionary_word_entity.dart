import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_word_entity.dart';

class UserDictionaryWordEntity {
  final int id;
  final int displayBy;
  final String word;
  final String wordTranscription;
  final String wordTranslate;
  final String wordItemColor;
  final String addDateTime;
  final String changeDateTime;
  final int priority;

  const UserDictionaryWordEntity({
    required this.id,
    required this.displayBy,
    required this.word,
    required this.wordTranscription,
    required this.wordTranslate,
    required this.wordItemColor,
    required this.addDateTime,
    required this.changeDateTime,
    required this.priority,
  });

  bool equals(UserDictionaryChangeWordEntity other) {
    return word.trim() == other.word.trim() &&
        wordTranslate.trim() == other.wordTranslate.trim() &&
        wordItemColor == other.wordItemColor;
  }
}
