import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_category_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/dictionary_category_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class DictionaryCategoriesList extends StatelessWidget {
  const DictionaryCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<UserDictionaryCategoryEntity>>(
      future: Provider.of<UserDictionaryCategoryState>(context).fetchWordCategories(),
      builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryCategoryEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return AnimationLimiter(
            child: CupertinoScrollbar(
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
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(error: snapshot.error.toString());
        } else {
          return FutureIsEmpty(message: locale!.addFirstCategory);
        }
      },
    );
  }
}
