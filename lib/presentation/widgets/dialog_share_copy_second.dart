import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DialogShareCopySecond extends StatelessWidget {
  const DialogShareCopySecond({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VolumeSecondItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Card(
      color: myColor.mainChapterCardColor,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              Divider(
                indent: 24,
                endIndent: 24,
                color: myColor.myPrimaryColor,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                trailing: Icon(
                  CupertinoIcons.doc_on_clipboard,
                  color: myColor.myPrimaryColor,
                ),
                title: const Text(
                  'Скопировать',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  FlutterClipboard.copy(_contentForCopyAndShare());
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                indent: 16,
                endIndent: 16,
                color: myColor.myPrimaryColor,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                trailing: Icon(
                  CupertinoIcons.share,
                  color: myColor.myPrimaryColor,
                ),
                title: const Text(
                  'Поделиться',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Share.share(
                    _contentForCopyAndShare(),
                    sharePositionOrigin:
                        Rect.fromLTWH(0, 0, size.width, size.height / 2),
                  );
                  Navigator.of(context).pop();
                },
              ),
              Divider(
                indent: 24,
                endIndent: 24,
                color: myColor.myPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _contentForCopyAndShare() {
    return '${item.arabicName != null ? '${item.arabicName}\n' : ''}${item.arabicContent}\n\n'
        '${item.translationName != null ? '${item.translationName}\n' : ''}${item.translationContent}';
  }
}