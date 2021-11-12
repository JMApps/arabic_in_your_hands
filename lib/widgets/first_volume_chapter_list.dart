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
            ? Column(
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                      child: Row(
                        children: [
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
                              const SizedBox(height: 8),
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
                    ),
                  ),
                  const SizedBox(height: 8),
                  FirstVolumeSubChapterList(snapshot: snapshot),
                  const SizedBox(height: 8),
                ],
              )
            : Platform.isIOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator();
      },
    );
  }
}
