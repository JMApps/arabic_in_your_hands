import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

class ShareLinksButton extends StatelessWidget {
  const ShareLinksButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return IconButton(
      tooltip: locale.share_links_app,
      icon: const Icon(
        CupertinoIcons.share,
        color: Colors.white,
      ),
      onPressed: () {
        Share.share(
          '${locale.app_name_share}\n\n${locale.ios_version}:\nhttps://apps.apple.com/app/арабский-перед-тобой/id1602988060\n\n${locale.android_version}:\nhttps://play.google.com/store/apps/details?id=jmapps.arabicinyourhands',
          sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
        );
      },
    );
  }
}
