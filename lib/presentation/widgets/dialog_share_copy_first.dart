import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DialogShareCopyFirst extends StatelessWidget {
  const DialogShareCopyFirst({
    Key? key,
    required this.item,
  }) : super(key: key);

  final VolumeFirstItemSubChapterContentModel item;

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
          Container(
            padding: const EdgeInsets.only(top: 16),
            width: double.maxFinite,
            child: Text(
              'Поделиться',
              style: TextStyle(
                fontSize: 18,
                color: myColor.myAccentColor
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            trailing: Icon(
              CupertinoIcons.doc_on_clipboard,
              color: myColor.myAccentColor,
            ),
            title: const Text(
              'Скопировать',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              FlutterClipboard.copy(_contentForCopyAndShare());
              context.read<DictionaryContentState>().showSnackBarMessage(context, 'Скопировано');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            trailing: Icon(
              CupertinoIcons.share,
              color: myColor.myAccentColor,
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
        ],
      ),
    );
  }

  String _contentForCopyAndShare() {
    return '${item.arabicName != null ? '${item.arabicName}\n' : ''}${item.arabicContent}\n\n'
        '${item.translationName != null ? '${item.translationName}\n' : ''}${item.translationContent}';
  }
}
