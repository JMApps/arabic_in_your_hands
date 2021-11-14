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
        if (snapshot.hasData) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(left: 8, top: 8),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Card(
                    elevation: 1,
                    margin: const EdgeInsets.only(left: 16, bottom: 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: Color(0xFFD5FFEF),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                                color: Color(0xFF243743),
                                shape: BoxShape.circle),
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
                            color: const Color(0xFF219271),
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
                    ),
                  ),
                  FirstVolumeSubChapterList(snapshot: snapshot),
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
