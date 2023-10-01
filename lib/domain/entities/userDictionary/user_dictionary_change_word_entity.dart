class UserDictionaryChangeWordEntity {
  final int id;
  final String word;
  final String wordTranslate;
  final String wordItemColor;
  final String changeDateTime;

  const UserDictionaryChangeWordEntity({
    required this.id,
    required this.word,
    required this.wordTranslate,
    required this.wordItemColor,
    required this.changeDateTime,
  });
}
