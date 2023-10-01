import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_category_entity.dart';
import 'package:arabicinyourhands/domain/repositories/userDictionary/user_dictionary_category_repository.dart';

class UserDictionaryCategoriesUseCase {

  final UserDictionaryCategoryRepository _userDictionaryCategoryRepository;

  UserDictionaryCategoriesUseCase(this._userDictionaryCategoryRepository);

  Future<List<UserDictionaryCategoryEntity>> fetchWordCategories() async {
    try {
      final List<UserDictionaryCategoryEntity> wordCategories = await _userDictionaryCategoryRepository.getAllCategories();
      return wordCategories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<UserDictionaryCategoryEntity>> fetchWordCategoryById({required int categoryId}) async {
    try {
      final List<UserDictionaryCategoryEntity> wordCategoriesById = await _userDictionaryCategoryRepository.getCategoryById(categoryId: categoryId);
      return wordCategoriesById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> addCategory({required UserDictionaryAddCategoryEntity model}) async {
    try {
      final int categoryEntity = await _userDictionaryCategoryRepository.addCategory(model: model);
      return categoryEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> changeCategory({required UserDictionaryChangeCategoryEntity model}) async {
    try {
      final int categoryEntity = await _userDictionaryCategoryRepository.changeCategory(model: model);
      return categoryEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteCategory({required int categoryId}) async {
    try {
      final int categoryEntity = await _userDictionaryCategoryRepository.deleteCategory(categoryId: categoryId);
      return categoryEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteAllCategories() async {
    try {
      final int categoryEntity = await _userDictionaryCategoryRepository.deleteAllCategories();
      return categoryEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}