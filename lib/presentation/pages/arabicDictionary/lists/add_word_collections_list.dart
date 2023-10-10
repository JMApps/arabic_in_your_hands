import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/add_word_collection_item.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/add_collection_popup.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class AddWordCollectionsList extends StatefulWidget {
  const AddWordCollectionsList({
    super.key,
    required this.wordModel,
  });

  final WordEntity wordModel;

  @override
  State<AddWordCollectionsList> createState() => _AddWordCollectionsListState();
}

class _AddWordCollectionsListState extends State<AddWordCollectionsList> {

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Column(
      children: [
        Expanded(
          child: Consumer<CollectionState>(
            builder: (BuildContext context, _, __) {
              return FutureBuilder<List<CollectionEntity>>(
                future: Provider.of<CollectionState>(context).fetchAllCollections(),
                builder: (BuildContext context, AsyncSnapshot<List<CollectionEntity>> snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      padding: AppStyles.mainMardingMini,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final CollectionEntity model = snapshot.data![index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 250),
                          child: SlideAnimation(
                            verticalOffset: 150,
                            child: FadeInAnimation(
                              child: AddWordCollectionItem(
                                collectionModel: model,
                                wordModel: widget.wordModel,
                                index: index,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return ErrorDataText(error: snapshot.error.toString());
                  } else {
                    return FutureIsEmpty(message: locale!.addFirstCollection);
                  }
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 250),
                curve: Curves.decelerate,
                child: const AddCollectionPopup(),
              ),
            );
          },
          child: Text(
            locale!.addCollection,
          ),
        ),
      ],
    );
  }
}
