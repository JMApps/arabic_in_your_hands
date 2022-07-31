import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/presentation/items/fist_volume_sub_chapter_item.dart';
import 'package:flutter/material.dart';

class FirstVolumeSubChapterList extends StatelessWidget {
  FirstVolumeSubChapterList({Key? key, required this.chapterId})
      : super(key: key);

  final int chapterId;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllFirstSubChapters(chapterId),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FistVolumeSubChapterItem(
                    item: snapshot.data![index],
                    subChapterIndex: index,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
