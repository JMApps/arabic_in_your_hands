import 'package:arabicinyourhands/widgets/first_volume_sub_chapter_item.dart';
import 'package:flutter/material.dart';

class FirstVolumeSubChapterList extends StatelessWidget {
  const FirstVolumeSubChapterList({
    Key? key,
    required this.snapshot,
    required this.chapterId,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return FirstVolumeSubChapterItem(
            item: snapshot.data![index],
            subChapterIndex: index,
            chapterId: chapterId,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 0.5),
      ),
    );
  }
}
