import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/presentation/items/second_volume_sub_chapter_content_item_left.dart';
import 'package:arabicinyourhands/presentation/items/second_volume_sub_chapter_content_item_right.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeSubChapterContentList extends StatelessWidget {
  SecondVolumeSubChapterContentList(
      {Key? key, required this.secondVolumeSubChapterId})
      : super(key: key);

  final int secondVolumeSubChapterId;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllVolumeSecondChapterContent(secondVolumeSubChapterId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          context.read<ContentPlayerState>().initPlayer(snapshot);
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return index.isOdd
                  ? SecondVolumeSubChapterContentItemLeft(
                      item: snapshot.data![index],
                      index: index,
                    )
                  : SecondVolumeSubChapterContentItemRight(
                      item: snapshot.data![index],
                      index: index,
                    );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
