import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';

abstract class UserDictionaryCategoryRepository {
  Future<List<UserDictionaryCategoryEntity>> getAllCategories();

  Future<List<UserDictionaryCategoryEntity>> getCategoryById({required int categoryId});
}