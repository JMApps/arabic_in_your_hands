class UserDictionaryCategoryModel {
  final int id;
  final String wordCategoryTitle;
  final String wordCategoryColor;
  final int priority;
  final String addDateTime;
  final String changeDateTime;

  const UserDictionaryCategoryModel({
    required this.id,
    required this.wordCategoryTitle,
    required this.wordCategoryColor,
    required this.priority,
    required this.addDateTime,
    required this.changeDateTime,
  });

  factory UserDictionaryCategoryModel.fromMap(Map<String, dynamic> map) {
    return UserDictionaryCategoryModel(
      id: map['_id'],
      wordCategoryTitle: map['wordCategoryTitle'],
      wordCategoryColor: map['wordCategoryColor'],
      priority: map['priority'],
      addDateTime: map['addDateTime'],
      changeDateTime: map['changeDateTime'],
    );
  }
}
