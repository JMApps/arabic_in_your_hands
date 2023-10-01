class UserDictionaryAddWordEntity {
  final int id;
  final int displayBy;
  final String word;
  final String wordTranscription;
  final String wordTranslate;
  final String wordItemColor;
  final String addDateTime;
  final String changeDateTime;
  final int priority;

  const UserDictionaryAddWordEntity({
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
}
