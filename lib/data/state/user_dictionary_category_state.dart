import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_category_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_category_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_categories_use_case.dart';
import 'package:flutter/material.dart';

class UserDictionaryCategoryState extends ChangeNotifier {
  final UserDictionaryCategoriesUseCase _categoriesUseCase = UserDictionaryCategoriesUseCase(
    UserDictionaryCategoryDataRepository(),
  );

  Future<List<UserDictionaryCategoryEntity>> fetchWordCategories() async {
    final Future<List<UserDictionaryCategoryEntity>> wordCategories = _categoriesUseCase.fetchWordCategories();
    return wordCategories;
  }

  Future<UserDictionaryCategoryEntity> fetchWordCategoryById({required int categoryId}) async {
    final Future<UserDictionaryCategoryEntity> wordCategories = _categoriesUseCase.fetchWordCategoryById(categoryId: categoryId);
    return wordCategories;
  }

  Future<int> addCategory({required UserDictionaryAddCategoryEntity model}) async {
    final int categoryEntity = await _categoriesUseCase.addCategory(model: model);
    notifyListeners();
    return categoryEntity;
  }

  Future<int> changeCategory({required UserDictionaryChangeCategoryEntity model}) async {
    final int categoryEntity = await _categoriesUseCase.changeCategory(model: model);
    notifyListeners();
    return categoryEntity;
  }

  Future<int> deleteCategory({required int categoryId}) async {
    final int categoryEntity = await _categoriesUseCase.deleteCategory(categoryId: categoryId);
    notifyListeners();
    return categoryEntity;
  }

  Future<int> deleteAllCategories() async {
    final int categoryEntity = await _categoriesUseCase.deleteAllCategories();
    notifyListeners();
    return categoryEntity;
  }
}
