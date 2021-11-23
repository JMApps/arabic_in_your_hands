import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/model/volume_second_item_chapter_model.dart';
import 'package:arabicinyourhands/widgets/second_volume_sub_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondVolumeChapterList extends StatelessWidget {
  SecondVolumeChapterList({Key? key, required this.item}) : super(key: key);

  final VolumeSecondItemChapterModel item;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllSecondSubChapters(item.id!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(top: 8),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Card(
                    elevation: 1,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFFD5FFEF),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: const BoxDecoration(
                              color: Color(0xFF243743),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              '${item.id}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SvgPicture.asset(
                            'assets/icons/${item.chapterIcon}.svg',
                            width: 40,
                            height: 40,
                            color: const Color(0xFF006D50),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${item.chapterTitle}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF243743),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${item.chapterTitleArabic}',
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF006D50),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Hafs'),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SecondVolumeSubChapterList(snapshot: snapshot),
                ],
              ),
            ),
          );
        } else {
          return Platform.isIOS
              ? const CupertinoActivityIndicator()
              : const CircularProgressIndicator();
        }
      },
    );
  }
}
