import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:flutter/material.dart';

class FirstVolumeSubChapterContentItem extends StatelessWidget {
  const FirstVolumeSubChapterContentItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    final bool isOdd = item.id.isOdd;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: isOdd ? const Radius.circular(16) : const Radius.circular(0),
          bottomLeft: isOdd ? const Radius.circular(16) : const Radius.circular(0),
          topRight: isOdd ? const Radius.circular(0) : const Radius.circular(16),
          bottomRight: isOdd ? const Radius.circular(0) : const Radius.circular(16),
        ),
      ),
      margin: EdgeInsets.only(
        left: isOdd ? 16 : 0,
        top: 16,
        right: isOdd ? 0 : 16,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            item.arabicName != null ? Text('${item.arabicName}', style: const TextStyle(),) : const SizedBox(),
            Text(item.arabicContent, style: const TextStyle(),),
            item.translationName != null ? Text('${item.translationName}', style: const TextStyle(),) : const SizedBox(),
            Text(item.translationContent, style: const TextStyle(),),
          ],
        ),
      ),
    );
  }
}
