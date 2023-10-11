import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/word_collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/collection_options.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddWordCollectionItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Color itemOddColor = appColors.primary.withOpacity(0.05);
    final Color itemEvenColor = appColors.primary.withOpacity(0.15);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () async {
          Navigator.pop(context);
          await Provider.of<WordCollectionState>(context, listen: false)
              .addWordToCollection(word: wordModel, collectionId: collectionModel.id).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: appColors.secondary,
                    duration: const Duration(milliseconds: 500),
                    content: SnackBarMessage(
                      message: locale!.wordAddedToCollection,
                    ),
                  ),
                ),
              );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => CollectionOptions(collectionId: collectionModel.id),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: index.isOdd ? itemOddColor : itemEvenColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Text(
            collectionModel.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
