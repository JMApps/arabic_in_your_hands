import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DialogShareCopyFirst extends StatelessWidget {
  const DialogShareCopyFirst({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VolumeFirstItemSubChapterContentModel item;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              const Divider(
                indent: 24,
                endIndent: 24,
                color: Color(0xFF243743),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                trailing: const Icon(
                  CupertinoIcons.doc_on_clipboard,
                  color: Color(0xFF243743),
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
              const Divider(
                indent: 16,
                endIndent: 16,
                color: Color(0xFF243743),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                trailing: const Icon(
                  CupertinoIcons.share,
                  color: Color(0xFF243743),
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
              const Divider(
                indent: 24,
                endIndent: 24,
                color: Color(0xFF243743),
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
