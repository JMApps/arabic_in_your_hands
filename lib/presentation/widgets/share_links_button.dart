import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';

class ShareLinksButton extends StatelessWidget {
  const ShareLinksButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return IconButton(
      tooltip: locale!.share,
      icon: const Icon(
        CupertinoIcons.share,
      ),
      onPressed: () {
        Share.share(
          '${locale.appName}\n\n${locale.iosVersion}:\nhttps://apps.apple.com/app/арабский-перед-тобой/id1602988060\n\n${locale.androidVersion}:\nhttps://play.google.com/store/apps/details?id=jmapps.arabicinyourhands',
          sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
        );
      },
    );
  }
}
