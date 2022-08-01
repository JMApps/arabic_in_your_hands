import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/presentation/items/first_volume_sub_chapter_content_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstVolumeSubChapterContentList extends StatelessWidget {
  FirstVolumeSubChapterContentList(
      {Key? key, required this.firstVolumeSubChapterId})
      : super(key: key);

  final int firstVolumeSubChapterId;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery
          .getAllVolumeFirstChapterContent(firstVolumeSubChapterId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CupertinoScrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return FirstVolumeSubChapterContentItem(
                  item: snapshot.data![index],
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
