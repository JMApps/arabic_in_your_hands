import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_word_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/items/dictionary_word_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class DictionaryWordsList extends StatelessWidget {
  const DictionaryWordsList({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<UserDictionaryWordEntity>>(
      future: Provider.of<UserDictionaryWordState>(context).fetchWordByCategoryId(categoryId: categoryId),
      builder: (BuildContext context, AsyncSnapshot<List<UserDictionaryWordEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return CupertinoScrollbar(
            child: AnimationLimiter(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final UserDictionaryWordEntity model = snapshot.data![index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 350),
                    child: SlideAnimation(
                      verticalOffset: 250,
                      child: FadeInAnimation(
                        child: DictionaryWordItem(
                          model: model,
                          categoryId: categoryId,
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
          return FutureIsEmpty(message: locale!.addFirstWord);
        }
      },
    );
  }
}
