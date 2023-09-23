import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:arabicinyourhands/main.dart';
import 'package:arabicinyourhands/presentation/lists/first_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

class FirstVolumeContentPage extends StatelessWidget {
  const FirstVolumeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.volume_1),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
        actions: [
          IconButton(
            tooltip: locale.share_links_app,
            splashRadius: 20,
            icon: const Icon(
              CupertinoIcons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(
                '${locale.app_name_share}\n\n${locale.ios_version}:\nhttps://apps.apple.com/ru/app/арабский-перед-тобой/id1602988060\n\n${locale.android_version}:\nhttps://play.google.com/store/apps/details?id=jmapps.arabicinyourhands',
                sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
              );
            },
          ),
        ],
      ),
      body: PageStorage(
        bucket: globalBucketFirstVolumeChapters,
        child: CupertinoScrollbar(
          child: FirstVolumeChapterList(
            key: const PageStorageKey<String>(
              AppConstraints.keyBucketFirstVolumeChapters,
            ),
          ),
        ),
      ),
    );
  }
}
