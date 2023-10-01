class UserDictionaryAddWordEntity {
  final int displayBy;
  final String word;
  final String wordTranslate;
  final String wordItemColor;
  final int priority;

  const UserDictionaryAddWordEntity({
    required this.displayBy,
    required this.word,
    required this.wordTranslate,
    required this.wordItemColor,
    required this.priority,
  });
}
