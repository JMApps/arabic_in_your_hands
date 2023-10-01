class UserDictionaryWordModel {
  final int id;
  final int displayBy;
  final String word;
  final String wordTranscription;
  final String wordTranslate;
  final String wordItemColor;
  final String addDateTime;
  final String changeDateTime;
  final int priority;

  const UserDictionaryWordModel({
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

  factory UserDictionaryWordModel.fromMap(Map<String, dynamic> map) {
    return UserDictionaryWordModel(
      id: map['_id'],
      displayBy: map['displayBy'],
      word: map['word'],
      wordTranscription: map['wordTranscription'],
      wordTranslate: map['wordTranslate'],
      wordItemColor: map['wordItemColor'],
      addDateTime: map['addDateTime'],
      changeDateTime: map['changeDateTime'],
      priority: map['priority'],
    );
  }
}
