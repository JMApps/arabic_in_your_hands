import 'package:arabicinyourhands/presentation/lists/second_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SecondVolumeContentPage extends StatelessWidget {
  const SecondVolumeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Том 2'),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
        actions: [
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
                sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 2),
              );
            },
          ),
        ],
      ),
      body: CupertinoScrollbar(
        child: SecondVolumeChapterList(),
      ),
    );
  }
}
