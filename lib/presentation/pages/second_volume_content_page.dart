import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:arabicinyourhands/presentation/lists/second_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final globalBucketSecondVolumeChapters = PageStorageBucket();

class SecondVolumeContentPage extends StatelessWidget {
  const SecondVolumeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.volume_2),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
        actions: [
          IconButton(
            tooltip: appLocalizations.share_links_app,
            splashRadius: 20,
            icon: const Icon(
              CupertinoIcons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(
                '${appLocalizations.app_name_share}\n\n${appLocalizations.ios_version}:\nhttps://apps.apple.com/ru/app/арабский-перед-тобой/id1602988060\n\n${appLocalizations.android_version}:\nhttps://play.google.com/store/apps/details?id=jmapps.arabicinyourhands',
                sharePositionOrigin:
                    Rect.fromLTWH(0, 0, size.width, size.height / 2),
              );
            },
          ),
        ],
      ),
      body: PageStorage(
        bucket: globalBucketSecondVolumeChapters,
        child: CupertinoScrollbar(
          child: SecondVolumeChapterList(
            key: const PageStorageKey<String>(
                AppConstraints.keyBucketSecondVolumeChapters),
          ),
        ),
      ),
    );
  }
}
