import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/lists/words_collection_flip_list.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionDetailFlipPage extends StatelessWidget {
  const CollectionDetailFlipPage({
    super.key,
    required this.model,
  });

  final CollectionEntity model;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentFlipState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          actions: [
            Consumer<ContentFlipState>(
              builder: (BuildContext context, flipState, _) {
                return IconButton(
                  icon: Icon(
                    flipState.getCardSideMode
                        ? CupertinoIcons.rotate_right
                        : CupertinoIcons.rotate_left,
                  ),
                  onPressed: () {
                    flipState.changeFlipSide();
                  },
                );
              },
            ),
          ],
        ),
        body: WordsCollectionFlipList(collectionModel: model),
      ),
    );
  }
}
