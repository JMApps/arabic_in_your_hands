class DictionaryCategoryModel {
  final int id;
  final String wordCategoryTitle;
  final String wordCategoryColor;
  final int priority;
  final String addDateTime;
  final String changeDateTime;

  const DictionaryCategoryModel({
    required this.id,
    required this.wordCategoryTitle,
    required this.wordCategoryColor,
    required this.priority,
    required this.addDateTime,
    required this.changeDateTime,
  });

  DictionaryCategoryModel.fromMap(dynamic object)
      : id = object['_id'],
        wordCategoryTitle = object['wordCategoryTitle'],
        wordCategoryColor = object['wordCategoryColor'],
        priority = object['priority'],
        addDateTime = object['addDateTime'],
        changeDateTime = object['changeDateTime'];
}
