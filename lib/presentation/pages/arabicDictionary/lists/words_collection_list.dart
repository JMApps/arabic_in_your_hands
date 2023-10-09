import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/arabicDictionary/words_collection_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/words_collection_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_collection_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WordsCollectionList extends StatefulWidget {
  const WordsCollectionList({
    super.key,
    required this.collectionModel,
  });

  final CollectionEntity collectionModel;

  @override
  State<WordsCollectionList> createState() => _WordsCollectionListState();
}

class _WordsCollectionListState extends State<WordsCollectionList> {
  late final WordsCollectionUseCase _wordsCollectionUseCase;

  @override
  void initState() {
    super.initState();
    _wordsCollectionUseCase = WordsCollectionUseCase(WordsCollectionDataReposioty());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<WordEntity>>(
      future: _wordsCollectionUseCase.fetchWordsByCollectionId(
        collectionId: widget.collectionModel.id,
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
