import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_category_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_categories_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/dictionary_category_item.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchCategoryFuture extends StatefulWidget {
  const SearchCategoryFuture({super.key, required this.query});

  final String query;

  @override
  State<SearchCategoryFuture> createState() => _SearchCategoryFutureState();
}

class _SearchCategoryFutureState extends State<SearchCategoryFuture> {
  List<UserDictionaryCategoryEntity> _categories = [];
  List<UserDictionaryCategoryEntity> _recentCategories = [];

  late final UserDictionaryCategoriesUseCase _categoriesUseCase;

  @override
  void initState() {
    _categoriesUseCase = UserDictionaryCategoriesUseCase(UserDictionaryCategoryDataRepository.getInstance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List>(
      future: _categoriesUseCase.fetchWordCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _categories = snapshot.data;
          _recentCategories = widget.query.isEmpty
              ? _categories
              : _categories.where((element) =>
                      element.id.toString().contains(widget.query) ||
                      element.wordCategoryTitle.contains(widget.query.toLowerCase())).toList();
          if (_recentCategories.isEmpty && widget.query.isNotEmpty) {
            return FutureIsEmpty(message: locale!.search_is_not_results);
          } else if (_recentCategories.isEmpty) {
            return FutureIsEmpty(message: locale!.categories_is_empty);
          } else {
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: _recentCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  final UserDictionaryCategoryEntity model =
                      _recentCategories[index];
                  return DictionaryCategoryItem(
                    model: model,
                    index: index,
                  );
                },
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
