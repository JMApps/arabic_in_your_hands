import 'package:arabicinyourhands/presentation/lists/first_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstVolumeContentPage extends StatelessWidget {
  const FirstVolumeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Том 1'),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
      ),
      body: CupertinoScrollbar(
        child: FirstVolumeChapterList(),
      ),
    );
  }
}
