import 'package:arabicinyourhands/model/volume_first_item_sub_chapter_model.dart';
import 'package:flutter/material.dart';

class FirstVolumeSubChapterItem extends StatelessWidget {
  const FirstVolumeSubChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemSubChapterModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: const Color(0xFF8A949B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(width: 1, color: Color(0xFF243743)),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            '${item.dialogTitle}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
