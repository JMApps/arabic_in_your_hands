import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/widgets/second_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolumeTwo extends StatelessWidget {
  VolumeTwo({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllSecondChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Scrollbar(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SecondVolumeChapterList(
                          item: snapshot.data![index]);
                    },
                  ),
                ),
              )
            : Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator();
      },
    );
  }
}
