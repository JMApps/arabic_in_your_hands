import 'package:arabicinyourhands/domain/arguments/collection_args.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/lists/words_collection_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({
    super.key,
    required this.model,
  });

  final CollectionEntity model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/collection_detail_flip_page',
                arguments: CollectionArgs(model: model),
              );
            },
            icon: const Icon(
              CupertinoIcons.creditcard,
            ),
          ),
        ],
      ),
      body: WordsCollectionList(collectionModel: model),
    );
  }
}
