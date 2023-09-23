import 'dart:io';

import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlipShareCopyFirst extends StatelessWidget {
  FlipShareCopyFirst({
    Key? key,
    required this.item,
    required this.isFront,
  }) : super(key: key);

  final VolumeFirstItemSubChapterContentModel item;
  final bool isFront;
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final appLocalizations = AppLocalizations.of(context)!;
    return Card(
      color: myColor.mainChapterCardColor,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          bottom: 16,
          left: 16,
        ),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              width: double.maxFinite,
              child: Text(
                appLocalizations.share,
                style: TextStyle(fontSize: 18, color: myColor.myAccentColor),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              trailing: Icon(
                CupertinoIcons.doc_on_clipboard,
                color: myColor.myAccentColor,
              ),
              title: Text(
                appLocalizations.copy,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                FlutterClipboard.copy(
                    isFront ? _contentFrontCard() : _contentBackCard());
                context.read<DictionaryContentState>().showSnackBarMessage(context, appLocalizations.copied);
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              trailing: Icon(
                CupertinoIcons.share,
                color: myColor.myAccentColor,
              ),
              title: Text(
                appLocalizations.share,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                Share.share(
                  isFront ? _contentFrontCard() : _contentBackCard(),
                  sharePositionOrigin:
                      Rect.fromLTWH(0, 0, size.width, size.height / 2),
                );
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              trailing: Icon(
                CupertinoIcons.photo_fill,
                color: myColor.myAccentColor,
              ),
              title: Text(
                appLocalizations.share_picture,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                _takeScreenshot(item, isFront);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  _takeScreenshot(
      VolumeFirstItemSubChapterContentModel item, bool isFront) async {
    final unit8List = await _screenshotController.captureFromWidget(
        _toPicture(item, isFront),
        delay: const Duration(seconds: 0));
    String tempPath = (Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory())!
        .path;
    File file = File('$tempPath/${isFront ? 'ar' : 'tr'}_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles(
      [file.path],
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
    );
  }

  Widget _toPicture(VolumeFirstItemSubChapterContentModel item, bool isFront) {
    return Card(
      elevation: 3,
      color: const Color(0xFFF5F5F5),
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: isFront
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      item.arabicName != null
                          ? SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                item.arabicName!,
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: Color(0xFF00796B),
                                  fontFamily: 'Scheherazade',
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          item.arabicContent,
                          style: const TextStyle(
                            fontSize: 35,
                            fontFamily: 'Scheherazade',
                            color: Colors.black,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      item.translationName != null
                          ? SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                item.translationName!,
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: Color(0xFF00796B),
                                ),
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          item.translationContent,
                          style: const TextStyle(
                            fontSize: 35,
                          ),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  String _contentFrontCard() {
    return '${item.arabicName != null ? '${item.arabicName}\n' : ''}${item.arabicContent}';
  }

  String _contentBackCard() {
    return '${item.translationName != null ? '${item.translationName}\n' : ''}${item.translationContent}';
  }
}
