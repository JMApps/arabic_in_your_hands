import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/presentation/items/second_volume_sub_chapter_item.dart';
import 'package:flutter/material.dart';

class SecondVolumeSubChapterList extends StatelessWidget {
  SecondVolumeSubChapterList({Key? key, required this.displayBy})
      : super(key: key);

  final int displayBy;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllSecondSubChapters(displayBy),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SecondVolumeSubChapterItem(
                    item: snapshot.data![index],
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
