class UserDictionaryChangeCategoryEntity {
  final int id;
  final String wordCategoryTitle;
  final String wordCategoryColor;
  final int priority;

  const UserDictionaryChangeCategoryEntity({
    required this.id,
    required this.wordCategoryTitle,
    required this.wordCategoryColor,
    required this.priority,
  });
}
