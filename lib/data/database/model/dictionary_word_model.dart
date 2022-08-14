class DictionaryWordModel {
  final int id;
  final int displayBy;
  final String word;
  final String wordTranscription;
  final String wordTranslate;
  final String wordItemColor;
  final String addDateTime;
  final String changeDateTime;
  final int priority;

  DictionaryWordModel({
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

  DictionaryWordModel.fromMap(dynamic object)
      : id = object['_id'],
        displayBy = object['displayBy'],
        word = object['word'],
        wordTranscription = object['wordTranscription'],
        wordTranslate = object['wordTranslate'],
        wordItemColor = object['wordItemColor'],
        addDateTime = object['addDateTime'],
        changeDateTime = object['changeDateTime'],
        priority = object['priority'];
}
