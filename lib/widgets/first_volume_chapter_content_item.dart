import 'package:arabicinyourhands/model/volume_first_item_chapter_content_model.dart';
import 'package:arabicinyourhands/provider/content_settings_state.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/widgets/snackbar_copy_message.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FirstVolumeChapterContentItem extends StatelessWidget {
  FirstVolumeChapterContentItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.player,
      required this.realtimePlayingInfo})
      : super(key: key);

  final VolumeFirstItemChapterContentModel item;
  final int index;
  final AssetsAudioPlayer player;
  final RealtimePlayingInfos realtimePlayingInfo;

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

  final List<String> _getArabicFonts = [
    'Scheherazade',
    'Markazi',
    'Lateef',
  ];

  final List<String> _getTranslationFonts = [
    'Gilroy',
    'Play',
    'Roboto',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: item.id!.isOdd
          ? const EdgeInsets.only(left: 16, top: 8, bottom: 8)
          : const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      elevation: 5,
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
        borderRadius: BorderRadius.circular(25),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 750),
          curve: Curves.fastOutSlowIn,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: item.id!.isOdd
                  ? player.readingPlaylist!.currentIndex == index &&
                          realtimePlayingInfo.isPlaying
                      ? [
                          const Color(0xFFFFF5D5),
                          const Color(0xFFFFF8E9),
                          const Color(0xFFFFFFFF),
                        ]
                      : [
                          const Color(0xFFD5FFF1),
                          const Color(0xFFE9FFF5),
                          const Color(0xFFFFFFFF),
                        ]
                  : player.readingPlaylist!.currentIndex == index &&
                          realtimePlayingInfo.isPlaying
                      ? [
                          const Color(0xFFFFFFFF),
                          const Color(0xFFFFF8E9),
                          const Color(0xFFFFF5D5),
                        ]
                      : [
                          const Color(0xFFFFFFFF),
                          const Color(0xFFECF7FF),
                          const Color(0xFFD5EFFF),
                        ],
            ),
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
                            fontFamily: _getArabicFonts[context
                                .watch<ContentSettingsState>()
                                .getArabicFontRadioGroupValue],
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
                              fontFamily: _getArabicFonts[context
                                  .watch<ContentSettingsState>()
                                  .getArabicFontRadioGroupValue],
                              color: Colors.black),
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
                visible: player.readingPlaylist!.currentIndex == index &&
                        realtimePlayingInfo.isPlaying
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
                            fontFamily: _getTranslationFonts[context
                                .read<ContentSettingsState>()
                                .getTranslationFontRadioGroupValue],
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
                            fontFamily: _getTranslationFonts[context
                                .read<ContentSettingsState>()
                                .getTranslationFontRadioGroupValue],
                            color: Colors.black,
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
        splashColor: Colors.red,
        onTap: () {
          player.playlistPlayAtIndex(index);
        },
        onLongPress: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            leading: const Icon(CupertinoIcons.share),
                            title: const Text(
                              'Поделиться',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            onTap: () {
                              Share.share(
                                  '${item.arabicName != null ? '${item.arabicName}\n${item.arabicContent}\n' : '${item.arabicContent}\n'}'
                                  '${item.translationName != null ? '${item.translationName}\n${item.translationContent}' : '${item.translationContent}'}');
                              Navigator.of(context).pop();
                            },
                          ),
                          SnackBarCopyMessage(
                              content:
                                  '${item.arabicName != null ? '${item.arabicName}\n${item.arabicContent}\n' : '${item.arabicContent}\n'}'
                                  '${item.translationName != null ? '${item.translationName}\n${item.translationContent}' : '${item.translationContent}'}'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
