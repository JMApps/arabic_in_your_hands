import 'package:arabicinyourhands/model/volume_first_item_chapter_content_model.dart';
import 'package:arabicinyourhands/provider/content_settings_state.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolumeChapterContentItem extends StatelessWidget {
  FirstVolumeChapterContentItem({Key? key, required this.item})
      : super(key: key);

  final VolumeFirstItemChapterContentModel item;
  final List<TextAlign> _getTextAlignOne = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
  ];

  final List<TextAlign> _getTextAlignTwo = [
    TextAlign.right,
    TextAlign.center,
    TextAlign.left,
  ];

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
        child: Column(
          children: [
            item.arabicName != null ? SizedBox(
              width: double.maxFinite,
              child: Visibility(
                child: Text(
                  '${item.arabicName}',
                  style: TextStyle(
                    fontSize: context.watch<ContentSettingsState>().getTextArabicSize.toDouble(),
                    color: const Color(0xFF1F8D6E),
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: _getTextAlignOne[context.watch<ContentSettingsState>().getToggleButtonIndex],
                ),
                visible: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
              ),
            ) : const SizedBox(),
            const SizedBox(height: 4),
            item.arabicContent != null ? SizedBox(
              width: double.maxFinite,
              child: Visibility(
                child: Text(
                  '${item.arabicContent}',
                  style: TextStyle(
                      fontSize: context.watch<ContentSettingsState>().getTextArabicSize.toDouble(),
                      color: Colors.black54),
                  textDirection: TextDirection.rtl,
                  textAlign: _getTextAlignOne[context.watch<ContentSettingsState>().getToggleButtonIndex],
                ),
                visible: context.watch<VolumeContentDialogVisibilityState>().getFirstDialogVisibility,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
              ),
            ) : const SizedBox(),
            const SizedBox(height: 2),
            Visibility(
              child: Icon(
                item.id!.isOdd
                    ? CupertinoIcons.speaker_zzz_fill
                    : CupertinoIcons.speaker_zzz_fill_rtl,
                size: 20,
                color: const Color(0xFF243743),
              ),
              visible: true,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
            ),
            const SizedBox(height: 2),
            item.translationName != null ? SizedBox(
              width: double.maxFinite,
              child: Visibility(
                child: Text(
                  '${item.translationName}',
                  style: TextStyle(
                    fontSize: context.watch<ContentSettingsState>().getTextTranslationSize.toDouble(),
                    color: const Color(0xFF243743),
                  ),
                  textAlign: _getTextAlignTwo[context.watch<ContentSettingsState>().getToggleButtonIndex],
                ),
                visible: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
              ),
            ) : const SizedBox(),
            const SizedBox(height: 4),
            item.translationContent != null ? SizedBox(
              width: double.maxFinite,
              child: Visibility(
                child: Text(
                  '${item.translationContent}',
                  style: TextStyle(
                    fontSize: context.watch<ContentSettingsState>().getTextTranslationSize.toDouble(),
                    color: Colors.black54,
                  ),
                  textAlign: _getTextAlignTwo[context.watch<ContentSettingsState>().getToggleButtonIndex],
                ),
                visible: context.watch<VolumeContentDialogVisibilityState>().getSecondDialogVisibility,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
              ),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}