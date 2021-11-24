import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/widgets/content_player.dart';
import 'package:arabicinyourhands/widgets/content_settings.dart';
import 'package:arabicinyourhands/widgets/first_volume_chapter_content_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentVolumeOne extends StatelessWidget {
  ContentVolumeOne({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments
        as ContentVolumeOneArguments?;
    return FutureBuilder<List>(
      future: _databaseQuery.getAllVolumeFirstChapterContent(_arguments!.id!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${snapshot.error}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        } else {
          return snapshot.hasData
              ? Scaffold(
                  backgroundColor: const Color(0xFFFAFAFA),
                  body: CupertinoScrollbar(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          floating: true,
                          pinned: false,
                          snap: false,
                          centerTitle: true,
                          backgroundColor: const Color(0xFF243743),
                          title: Text('${_arguments.dialog}'),
                          actions: [
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ContentSettings();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return FirstVolumeChapterContentItem(
                                  item: snapshot.data![index]);
                            },
                            childCount: snapshot.data!.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    height: 65,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF243743),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: const ContentPlayer(),
                  ),
                )
              : Platform.isAndroid
                  ? const CircularProgressIndicator()
                  : const CupertinoActivityIndicator();
        }
      },
    );
  }
}
