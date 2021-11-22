import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/widgets/second_volume_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class VolumeTwo extends StatelessWidget {
  VolumeTwo({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllSecondChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasError
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '${snapshot.error}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            : snapshot.hasData
                ? Scrollbar(
                    child: SingleChildScrollView(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50,
                                child: FadeInAnimation(
                                    child: SecondVolumeChapterList(
                                        item: snapshot.data![index])),
                              ),
                            );
                          },
                        ),
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
