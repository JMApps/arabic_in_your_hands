import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';

class SecondVolShareCopy extends StatelessWidget {
  const SecondVolShareCopy({
    super.key,
    required this.model,
  });

  final SecondVolContentEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? locale = AppLocalizations.of(context);
    return Container(
      padding: AppStyles.mainMardingWithoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            locale!.share,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: appColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: AppStyles.mainMardingHorizontal,
            shape: AppStyles.mainShape,
            trailing: Icon(
              CupertinoIcons.doc_on_clipboard,
              color: appColors.secondary,
            ),
            title: Text(
              locale.copy,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              FlutterClipboard.copy(_contentForCopyAndShare());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appColors.secondary,
                  duration: const Duration(milliseconds: 500),
                  content: SnackBarMessage(
                    message: locale.copied,
                  ),
                ),
              );
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            contentPadding: AppStyles.mainMardingHorizontal,
            shape: AppStyles.mainShape,
            trailing: Icon(
              CupertinoIcons.share,
              color: appColors.secondary,
            ),
            title: Text(
              locale.share,
              style: const TextStyle(fontSize: 18),
            ),
            onTap: () {
              Share.share(
                _contentForCopyAndShare(),
                sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  String _contentForCopyAndShare() {
    return '${model.arabicName != null ? '${model.arabicName}\n' : ''}${model.arabicContent}\n\n'
        '${model.translationName != null ? '${model.translationName}\n' : ''}${model.translationContent}';
  }
}
