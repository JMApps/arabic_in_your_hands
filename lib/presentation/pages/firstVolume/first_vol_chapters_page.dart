import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:arabicinyourhands/main.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/lists/first_volume_chapter_list.dart';
import 'package:arabicinyourhands/presentation/widgets/main_app_icon.dart';
import 'package:arabicinyourhands/presentation/widgets/share_links_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstVolChaptersPage extends StatelessWidget {
  const FirstVolChaptersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.volume_1),
        leading: const MainAppIcon(),
        actions: const [
          ShareLinksButton(),
        ],
      ),
      body: PageStorage(
        bucket: globalBucketFirstVolumeChapters,
        child: const CupertinoScrollbar(
          child: FirstVolumeChapterList(
            key: PageStorageKey<String>(
              AppConstraints.keyBucketFirstVolumeChapters,
            ),
          ),
        ),
      ),
    );
  }
}