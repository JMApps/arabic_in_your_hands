class UserDictionaryChangeWordEntity {
  final int id;
  final String word;
  final String wordTranslate;
  final String wordItemColor;
  final String changeDateTime;
  final int priority;

  const UserDictionaryChangeWordEntity({
    required this.id,
    required this.word,
    required this.wordTranslate,
    required this.wordItemColor,
    required this.changeDateTime,
    required this.priority,
  });
}
