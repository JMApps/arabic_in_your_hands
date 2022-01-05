class DictionaryWordModel {
  int? id;
  int? displayBy;
  String? word;
  String? wordTranscription;
  String? wordTranslate;
  String? wordItemColor;
  String? addDateTime;
  String? changeDateTime;
  int? priority;

  DictionaryWordModel(
    this.id,
    this.displayBy,
    this.word,
    this.wordTranscription,
    this.wordTranslate,
    this.wordItemColor,
    this.addDateTime,
    this.changeDateTime,
    this.priority,
  );

  DictionaryWordModel.fromMap(dynamic object) {
    id = object['_id'];
    displayBy = object['displayBy'];
    word = object['word'];
    wordTranscription = object['wordTranscription'];
    wordTranslate = object['wordTranslate'];
    wordItemColor = object['wordItemColor'];
    addDateTime = object['addDateTime'];
    changeDateTime = object['changeDateTime'];
    priority = object['priority'];
  }
}
