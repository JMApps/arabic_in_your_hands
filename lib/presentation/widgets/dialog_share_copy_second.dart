import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_content_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                style: TextStyle(
                  fontSize: 18,
                  color: myColor.myAccentColor,
                ),
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
                color: myColor.myPrimaryColor,
              ),
              title: Text(
                appLocalizations.copy,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                FlutterClipboard.copy(_contentForCopyAndShare());
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
                color: myColor.myPrimaryColor,
              ),
              title: Text(
                appLocalizations.share,
                style: const TextStyle(fontSize: 18),
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
      ),
    );
  }

  String _contentForCopyAndShare() {
    return '${item.arabicName != null ? '${item.arabicName}\n' : ''}${item.arabicContent}\n\n'
        '${item.translationName != null ? '${item.translationName}\n' : ''}${item.translationContent}';
  }
}
