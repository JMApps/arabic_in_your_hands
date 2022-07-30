import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_model.dart';
import 'package:flutter/material.dart';

class FistVolumeSubChapterItem extends StatelessWidget {
  const FistVolumeSubChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemSubChapterModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.teal[100],
      margin: const EdgeInsets.symmetric(horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

    );
  }
}
