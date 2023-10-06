import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_category_data_repository.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_category_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_categories_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/dictionary_category_item.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DictionaryCategoriesList extends StatefulWidget {
  const DictionaryCategoriesList({super.key});

  @override
  State<DictionaryCategoriesList> createState() => _DictionaryCategoriesListState();
}

class _DictionaryCategoriesListState extends State<DictionaryCategoriesList> {
  late final UserDictionaryCategoriesUseCase _categoriesUseCase;

  @override
  void initState() {
    _categoriesUseCase = UserDictionaryCategoriesUseCase(UserDictionaryCategoryDataRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Consumer<UserDictionaryCategoryState>(
      builder: (BuildContext context, value, Widget? child) {
        return FutureBuilder<List<UserDictionaryCategoryEntity>>(
          future: _categoriesUseCase.fetchWordCategories(),
          builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryCategoryEntity>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return AnimationLimiter(
                child: ListView.builder(
                  padding: AppStyles.mainMardingMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final UserDictionaryCategoryEntity model = snapshot.data![index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 250),
                      child: SlideAnimation(
                        verticalOffset: 150,
                        child: FadeInAnimation(
                          child: DictionaryCategoryItem(
                            model: model,
                            index: index,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return ErrorDataText(error: snapshot.error.toString());
            } else {
              return FutureIsEmpty(
                message: locale!.categories_is_empty,
              );
            }
          },
        );
      },
    );
  }
}
