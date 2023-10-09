import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/arabicDictionary/words_collection_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/words_collection_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/collection_options.dart';
import 'package:flutter/material.dart';

class AddWordCollectionItem extends StatefulWidget {
  const AddWordCollectionItem({
    super.key,
    required this.collectionModel,
    required this.wordModel,
    required this.index,
  });

  final CollectionEntity collectionModel;
  final WordEntity wordModel;
  final int index;

  @override
  State<AddWordCollectionItem> createState() => _AddWordCollectionItemState();
}

class _AddWordCollectionItemState extends State<AddWordCollectionItem> {
  late final WordsCollectionUseCase _wordsCollectionUseCase;

  @override
  void initState() {
    super.initState();
    _wordsCollectionUseCase = WordsCollectionUseCase(WordsCollectionDataReposioty());
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primary.withOpacity(0.05);
    final Color itemEvenColor = appColors.primary.withOpacity(0.15);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () async {
          Navigator.pop(context);
          await _wordsCollectionUseCase.addWordToCollection(word: widget.wordModel, collectionId: widget.collectionModel.id);
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => CollectionOptions(collectionId: widget.collectionModel.id),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: widget.index.isOdd ? itemOddColor : itemEvenColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Text(
            widget.collectionModel.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
