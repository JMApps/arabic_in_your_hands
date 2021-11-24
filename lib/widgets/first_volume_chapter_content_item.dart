import 'package:arabicinyourhands/model/volume_first_item_chapter_content_model.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolumeChapterContentItem extends StatelessWidget {
  const FirstVolumeChapterContentItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: item.id!.isOdd
          ? const EdgeInsets.only(left: 16, top: 8, bottom: 8)
          : const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: item.id!.isOdd
            ? const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: item.id!.isOdd
              ? const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
          gradient: item.id!.isOdd
              ? const LinearGradient(
                  colors: [Color(0xFFE6FFEC), Color(0xFFFFFFFF)],
                )
              : const LinearGradient(
                  colors: [Color(0xFFFFFFFF), Color(0xFFE6ECFF)],
                ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: item.id!.isOdd
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Icon(
                  item.id!.isOdd
                      ? CupertinoIcons.speaker_zzz_fill
                      : CupertinoIcons.speaker_zzz_fill_rtl,
                  size: 20,
                  color: const Color(0xFF243743),
                )),
            Column(
              children: [
                Visibility(
                  child: Text(
                    '${item.arabicName}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF1F8D6E),
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  visible: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                ),
                const SizedBox(height: 4),
                Visibility(
                  child: Text(
                    '${item.arabicContent}',
                    style: const TextStyle(fontSize: 20),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  visible: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                ),
                const SizedBox(height: 8),
                Visibility(
                  child: Text(
                    '${item.translationName}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF696F76),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  visible: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                ),
                const SizedBox(height: 4),
                Visibility(
                  child: Text(
                    '${item.translationContent}',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  visible: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
