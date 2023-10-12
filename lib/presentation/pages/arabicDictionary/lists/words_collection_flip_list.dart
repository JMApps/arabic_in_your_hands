import 'package:arabicinyourhands/data/state/word_collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_flip_card.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:arabicinyourhands/presentation/widgets/main_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WordsCollectionFlipList extends StatefulWidget {
  const WordsCollectionFlipList({
    super.key,
    required this.collectionModel,
  });

  final CollectionEntity collectionModel;

  @override
  State<WordsCollectionFlipList> createState() => _WordsCollectionFlipListState();
}

class _WordsCollectionFlipListState extends State<WordsCollectionFlipList> {
  final PageController _wordsPageController = PageController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<WordEntity>>(
      future: Provider.of<WordCollectionState>(context, listen: false).fetchWordsByCollectionId(
        collectionId: widget.collectionModel.id,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<WordEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _wordsPageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final WordEntity model = snapshot.data![index];
                    return WordFlipCard(model: model);
                  },
                ),
              ),
              MainSmoothPageIndicator(
                controller: _wordsPageController,
                length: snapshot.data!.length,
              ),
              const SizedBox(height: 16),
            ],
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
