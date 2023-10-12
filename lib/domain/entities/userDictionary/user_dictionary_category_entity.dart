import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_category_entity.dart';

class UserDictionaryCategoryEntity {
  final int id;
  final String wordCategoryTitle;
  final String wordCategoryColor;
  final int priority;
  final String addDateTime;
  final String changeDateTime;

  const UserDictionaryCategoryEntity({
    required this.id,
    required this.wordCategoryTitle,
    required this.wordCategoryColor,
    required this.priority,
    required this.addDateTime,
    required this.changeDateTime,
  });

  bool equals(UserDictionaryChangeCategoryEntity other) {
    return wordCategoryTitle.trim() == other.wordCategoryTitle.trim() &&
        wordCategoryColor == other.wordCategoryColor &&
        priority == other.priority;
  }
}
