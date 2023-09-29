class UserDictionaryChangeCategoryEntity {
  final int id;
  final String wordCategoryTitle;
  final String wordCategoryColor;
  final int priority;
  final String changeDateTime;

  const UserDictionaryChangeCategoryEntity({
    required this.id,
    required this.wordCategoryTitle,
    required this.wordCategoryColor,
    required this.priority,
    required this.changeDateTime,
  });
}
