import 'package:arabicinyourhands/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/model/volume_first_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/provider/sub_chapter_selected_item_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolumeSubChapterItem extends StatelessWidget {
  const FirstVolumeSubChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemSubChapterModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: context.watch<SubChapterSelectedItemState>().getCurrentSelectedItem == item.id ? const Color(0xFF243743) : const Color(0xFF28B78D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xFFFAFAFA),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xFFD5FFEF),
                      Color(0xFFFFFFFF),
                    ]),
                  ),
                  child: Text(
                    '${item.dialog}',
                    style:
                        const TextStyle(color: Color(0xFF243743), fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${item.dialogTitle}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        splashColor: const Color(0xFF243743),
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.read<SubChapterSelectedItemState>().updateState(item.id!);
          Navigator.pushNamed(
            context,
            '/content_volume_one',
            arguments: ContentVolumeOneArguments(item.id, item.dialog, item.dialogTitle),
          );
        },
      ),
    );
  }
}
