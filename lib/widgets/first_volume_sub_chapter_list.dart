import 'package:arabicinyourhands/widgets/first_volume_sub_chapter_item.dart';
import 'package:flutter/material.dart';

class FirstVolumeSubChapterList extends StatelessWidget {
  const FirstVolumeSubChapterList({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return FirstVolumeSubChapterItem(
              item: snapshot.data![index]);
        },
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 0.5),
      ),
    );
  }
}
