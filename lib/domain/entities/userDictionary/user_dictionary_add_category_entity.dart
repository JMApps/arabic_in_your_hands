class UserDictionaryAddCategoryEntity {
  final String wordCategoryTitle;
  final String wordCategoryColor;
  final int priority;
  final String addDateTime;
  final String changeDateTime;

  const UserDictionaryAddCategoryEntity({
    required this.wordCategoryTitle,
    required this.wordCategoryColor,
    required this.priority,
    required this.addDateTime,
    required this.changeDateTime,
  });
}
