import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/widgets/first_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolumeOne extends StatelessWidget {
  VolumeOne({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllFirstChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Scrollbar(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FirstVolumeChapterList(item: snapshot.data![index]);
                  },
                ),
            )
            : Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator();
      },
    );
  }
}
