import 'package:arabicinyourhands/presentation/lists/second_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondVolumeContentPage extends StatelessWidget {
  const SecondVolumeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Том 2'),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
      ),
      body: CupertinoScrollbar(
        child: SecondVolumeChapterList(),
      ),
    );
  }
}
