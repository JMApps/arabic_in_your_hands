import 'package:arabicinyourhands/model/volume_second_item_chapter_content_model.dart';
import 'package:arabicinyourhands/provider/content_settings_state.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeChapterContentItem extends StatelessWidget {
  SecondVolumeChapterContentItem(
      {Key? key, required this.item, required this.index, required this.player})
      : super(key: key);

  final VolumeSecondItemChapterContentModel item;
  final int index;
  final AssetsAudioPlayer player;

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
    return player.builderRealtimePlayingInfos(
      builder: (BuildContext context, realtimePlayingInfo) {
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
          child: InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastOutSlowIn,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item.id!.isOdd
                    ? realtimePlayingInfo.isPlaying &&
                            player.readingPlaylist!.currentIndex == index
                        ? Colors.green[200]
                        : Colors.green[50]
                    : realtimePlayingInfo.isPlaying &&
                            player.readingPlaylist!.currentIndex == index
                        ? Colors.blue[200]
                        : Colors.blue[50],
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
              child: Column(
                children: [
                  item.arabicName != null
                      ? SizedBox(
                          width: double.maxFinite,
                          child: Visibility(
                            child: Text(
                              '${item.arabicName}',
                              style: TextStyle(
                                fontSize: context
                                    .watch<ContentSettingsState>()
                                    .getTextArabicSize
                                    .toDouble(),
                                color: const Color(0xFF1F8D6E),
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: _getTextAlignOne[context
                                  .watch<ContentSettingsState>()
                                  .getToggleButtonIndex],
                            ),
                            visible: context
                                .watch<VolumeContentDialogVisibilityState>()
                                .getFirstDialogVisibility,
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 4),
                  item.arabicContent != null
                      ? SizedBox(
                          width: double.maxFinite,
                          child: Visibility(
                            child: Text(
                              '${item.arabicContent}',
                              style: TextStyle(
                                  fontSize: context
                                      .watch<ContentSettingsState>()
                                      .getTextArabicSize
                                      .toDouble(),
                                  color: Colors.black54),
                              textDirection: TextDirection.rtl,
                              textAlign: _getTextAlignOne[context
                                  .watch<ContentSettingsState>()
                                  .getToggleButtonIndex],
                            ),
                            visible: context
                                .watch<VolumeContentDialogVisibilityState>()
                                .getFirstDialogVisibility,
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 2),
                  Visibility(
                    child: Icon(
                      item.id!.isOdd
                          ? CupertinoIcons.speaker_zzz_fill
                          : CupertinoIcons.speaker_zzz_fill_rtl,
                      size: 20,
                      color: const Color(0xFF243743),
                    ),
                    visible: realtimePlayingInfo.isPlaying &&
                            player.readingPlaylist!.currentIndex == index
                        ? true
                        : false,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                  ),
                  const SizedBox(height: 2),
                  item.translationName != null
                      ? SizedBox(
                          width: double.maxFinite,
                          child: Visibility(
                            child: Text(
                              '${item.translationName}',
                              style: TextStyle(
                                fontSize: context
                                    .watch<ContentSettingsState>()
                                    .getTextTranslationSize
                                    .toDouble(),
                                color: const Color(0xFF243743),
                              ),
                              textAlign: _getTextAlignTwo[context
                                  .watch<ContentSettingsState>()
                                  .getToggleButtonIndex],
                            ),
                            visible: context
                                .watch<VolumeContentDialogVisibilityState>()
                                .getSecondDialogVisibility,
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 4),
                  item.translationContent != null
                      ? SizedBox(
                          width: double.maxFinite,
                          child: Visibility(
                            child: Text(
                              '${item.translationContent}',
                              style: TextStyle(
                                fontSize: context
                                    .watch<ContentSettingsState>()
                                    .getTextTranslationSize
                                    .toDouble(),
                                color: Colors.black54,
                              ),
                              textAlign: _getTextAlignTwo[context
                                  .watch<ContentSettingsState>()
                                  .getToggleButtonIndex],
                            ),
                            visible: context
                                .watch<VolumeContentDialogVisibilityState>()
                                .getSecondDialogVisibility,
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            onTap: () {
              player.playlistPlayAtIndex(index);
            },
          ),
        );
      },
    );
  }
}
