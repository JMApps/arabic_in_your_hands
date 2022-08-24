import 'package:arabicinyourhands/domain/constants.dart';
import 'package:arabicinyourhands/presentation/lists/first_volume_chapter_list.dart';
import 'package:arabicinyourhands/presentation/widgets/info_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart';

final globalBucketFirstVolumeChapters = PageStorageBucket();

class FirstVolumeContentPage extends StatefulWidget {
  const FirstVolumeContentPage({Key? key}) : super(key: key);

  @override
  State<FirstVolumeContentPage> createState() => _FirstVolumeContentPageState();
}

class _FirstVolumeContentPageState extends State<FirstVolumeContentPage> {

  late bool isAppInfoShow;

  @override
  void initState() {
    var box = Hive.box(Constants.keyMainSettingBox);
    isAppInfoShow = box.get(Constants.keyAppInfoDialogShow, defaultValue: true);
    if (isAppInfoShow) {
      Future.delayed(const Duration(seconds: 1)).then(
            (value) => {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return const InfoApp();
            },
          ),
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Том 1'),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
        actions: [
          IconButton(
            tooltip: 'Информация для пользователей',
            splashRadius: 20,
            icon: const Icon(
              CupertinoIcons.info,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return const InfoApp();
                },
              );
            },
          ),
          IconButton(
            tooltip: 'Поделиться ссылками на приложение',
            splashRadius: 20,
            icon: const Icon(
              CupertinoIcons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(
                'Арабский перед тобой\n\nВерсия iOS:\nhttps://apps.apple.com/ru/app/арабский-перед-тобой/id1602988060\n\nВерсия android:\nhttps://play.google.com/store/apps/details?id=jmapps.arabicinyourhands',
                sharePositionOrigin:
                    Rect.fromLTWH(0, 0, size.width, size.height / 2),
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
                Constants.keyBucketFirstVolumeChapters),
          ),
        ),
      ),
    );
  }
}
