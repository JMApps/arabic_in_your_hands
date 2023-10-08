import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/arabicDictionary/collections_data_repository.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_category_data_repository.dart';
import 'package:arabicinyourhands/data/state/collection_state.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_category_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/coolections_use_case.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_categories_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/change_collection_popup.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/change_category_popup.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CollectionOptions extends StatefulWidget {
  const CollectionOptions({
    super.key,
    required this.collectionId,
  });

  final int collectionId;

  @override
  State<CollectionOptions> createState() => _CollectionOptionsState();
}

class _CollectionOptionsState extends State<CollectionOptions> {
  late final CollectionsUseCase _collectionsUseCase;

  @override
  void initState() {
    _collectionsUseCase = CollectionsUseCase(CollectionsDataReposioty());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<CollectionEntity>(
      future: _collectionsUseCase.fetchCollectionById(
        collectionId: widget.collectionId,
      ),
      builder: (BuildContext context, AsyncSnapshot<CollectionEntity> snapshot) {
        if (snapshot.hasData) {
          final CollectionEntity model = snapshot.data!;
          return Container(
            padding: AppStyles.mainMarding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appColors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: AnimatedPadding(
                            padding: MediaQuery.of(context).viewInsets,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.decelerate,
                            child: ChangeCollectionPopup(model: model),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    locale.changeCollection,
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteCollectionMessage,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondary,
                                    duration: const Duration(milliseconds: 500),
                                    content: SnackBarMessage(
                                      message: locale.collectionDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<CollectionState>(context, listen: false).deleteCollection(collectionId: model.id);
                              },
                              child: Text(
                                locale.delete,
                                style: TextStyle(color: appColors.error),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                locale.cancel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    locale.deleteCollection,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              locale.deleteAllCollectionsMessage,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondary,
                                    duration: const Duration(milliseconds: 500),
                                    content: SnackBarMessage(
                                      message: locale.collectionsDeleted,
                                    ),
                                  ),
                                );
                                Provider.of<CollectionState>(context, listen: false).deleteAllCollections();
                              },
                              child: Text(
                                locale.delete,
                                style: TextStyle(color: appColors.error),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                locale.cancel,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    locale.deleteAllCollections,
                    style: TextStyle(color: appColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(error: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
