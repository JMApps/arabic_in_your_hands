import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/presentation/items/second_volume_chapter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SecondVolumeChapterList extends StatelessWidget {
  SecondVolumeChapterList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllSecondChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? AnimationLimiter(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 12),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 150,
                      child: FadeInAnimation(
                        child: SecondVolumeChapterItem(
                          item: snapshot.data[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
