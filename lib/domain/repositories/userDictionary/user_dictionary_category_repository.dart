import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_category_entity.dart';

abstract class UserDictionaryCategoryRepository {
  Future<List<UserDictionaryCategoryEntity>> getAllCategories();

  Future<List<UserDictionaryCategoryEntity>> getCategoryById({required int categoryId});

  Future<int> addCategory({required UserDictionaryAddCategoryEntity model});

  Future<int> changeCategory({required UserDictionaryChangeCategoryEntity model});

  Future<int> deleteCategory({required int categoryId});
}