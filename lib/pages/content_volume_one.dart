import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/widgets/content_player.dart';
import 'package:arabicinyourhands/widgets/content_settings.dart';
import 'package:arabicinyourhands/widgets/first_volume_chapter_content_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentVolumeOne extends StatefulWidget {
  const ContentVolumeOne({Key? key}) : super(key: key);

  @override
  _ContentVolumeOneState createState() => _ContentVolumeOneState();
}

class _ContentVolumeOneState extends State<ContentVolumeOne> {
  final _databaseQuery = DatabaseQuery();
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments
        as ContentVolumeOneArguments?;
    return FutureBuilder<List>(
      future: _databaseQuery.getAllVolumeFirstChapterContent(_arguments!.id!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _setupPlayList(snapshot);
        }
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
                  body: _assetsAudioPlayer.builderRealtimePlayingInfos(
                      builder: (context, realtimePlayingInfo) {
                    return CupertinoScrollbar(
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            floating: true,
                            stretch: true,
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
                                      return SingleChildScrollView(
                                          child: ContentSettings());
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
                                  item: snapshot.data![index],
                                  index: index,
                                  player: _assetsAudioPlayer,
                                  realtimePlayingInfo: realtimePlayingInfo,
                                );
                              },
                              childCount: snapshot.data!.length,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  bottomNavigationBar: Container(
                    height: 65,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF243743),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ContentPlayer(
                        snapshot: snapshot, player: _assetsAudioPlayer),
                  ),
                )
              : Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                );
        }
      },
    );
  }

  _setupPlayList(AsyncSnapshot snapshot) async {
    var myList = List<Audio>.generate(snapshot.data!.length,
        (i) => Audio('assets/audios/${snapshot.data[i].audioName}.mp3'));

    _assetsAudioPlayer.open(
        Playlist(
          audios: myList,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }
}
