import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/model/volume_first_item_chapter_model.dart';
import 'package:arabicinyourhands/widgets/first_volume_sub_chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstVolumeChapterList extends StatelessWidget {
  FirstVolumeChapterList({Key? key, required this.item}) : super(key: key);

  final VolumeFirstItemChapterModel item;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllFirstSubChapters(item.id!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Card(
                margin: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      gradient: LinearGradient(colors: [
                        Color(0xFFD5FFEF),
                        Color(0xFFFFFFFF),
                      ])),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          Text(
                            '${item.id}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF243743),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SvgPicture.asset(
                            'assets/icons/${item.chapterIcon}.svg',
                            width: 35,
                            height: 35,
                            color: const Color(0xFF28B78D),
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
                                    color: Color(0xFF28B78D),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Hafs'),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ],
                      ),
                      FirstVolumeSubChapterList(snapshot: snapshot),
                    ],
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
