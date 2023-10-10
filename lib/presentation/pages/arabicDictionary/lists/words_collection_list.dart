import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/word_collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_collection_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class WordsCollectionList extends StatelessWidget {
  const WordsCollectionList({
    super.key,
    required this.collectionModel,
  });

  final CollectionEntity collectionModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<WordEntity>>(
      future: Provider.of<WordCollectionState>(context).fetchWordsByCollectionId(
        collectionId: collectionModel.id,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<WordEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return CupertinoScrollbar(
            child: ListView.builder(
              padding: AppStyles.mainMardingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final WordEntity model = snapshot.data![index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 250),
                  child: SlideAnimation(
                    verticalOffset: 150,
                    child: FadeInAnimation(
                      child: WordCollectionItem(
                        model: model,
                        wordCollectionId: collectionModel.id,
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
          return FutureIsEmpty(message: locale!.collectionIsEmpty);
        }
      },
    );
  }
}
