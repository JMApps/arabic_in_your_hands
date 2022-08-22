import 'package:arabicinyourhands/presentation/lists/first_volume_chapter_list.dart';
import 'package:arabicinyourhands/presentation/widgets/info_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FirstVolumeContentPage extends StatelessWidget {
  const FirstVolumeContentPage({Key? key}) : super(key: key);

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
      body: CupertinoScrollbar(
        child: FirstVolumeChapterList(),
      ),
    );
  }
}
