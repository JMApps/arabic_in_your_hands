import 'dart:io';

import 'package:arabicinyourhands/data/database_query.dart';
import 'package:arabicinyourhands/model/content_volume_two_arguments.dart';
import 'package:arabicinyourhands/provider/two_sub_chapter_selected_item_state.dart';
import 'package:arabicinyourhands/widgets/content_player.dart';
import 'package:arabicinyourhands/widgets/content_settings.dart';
import 'package:arabicinyourhands/widgets/second_volume_chapter_content_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentVolumeTwo extends StatefulWidget {
  const ContentVolumeTwo({Key? key}) : super(key: key);

  @override
  _ContentVolumeTwoState createState() => _ContentVolumeTwoState();
}

class _ContentVolumeTwoState extends State<ContentVolumeTwo> {
  final _databaseQuery = DatabaseQuery();
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments as ContentVolumeTwoArguments?;
    return FutureBuilder<List>(
      future: _databaseQuery.getAllVolumeSecondChapterContent(_arguments!.subChapterId!),
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
                      return FutureBuilder<List>(
                        future: _databaseQuery.getAllSecondSubChapters(_arguments.chapterId!),
                        builder: (BuildContext context,
                            AsyncSnapshot subChapterSnapshot) {
                          return subChapterSnapshot.hasData
                              ? CupertinoScrollbar(
                                  child: CustomScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    slivers: [
                                      SliverAppBar(
                                        floating: true,
                                        stretch: true,
                                        centerTitle: true,
                                        backgroundColor: const Color(0xFF243743),
                                        flexibleSpace: const FlexibleSpaceBar(
                                          centerTitle: false,
                                          title: Text('к главам'),
                                        ),
                                        actions: [
                                          IconButton(
                                            icon: const Icon(
                                              CupertinoIcons.settings,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              showCupertinoModalPopup(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SingleChildScrollView(
                                                      child: ContentSettings());
                                                },
                                              );
                                            },
                                          ),
                                          _arguments.subChapterIndex! + 1 < subChapterSnapshot.data.length
                                              ? IconButton(
                                            icon: const Icon(
                                              CupertinoIcons.forward,
                                            ),
                                            onPressed: () {
                                              context.read<TwoSubChapterSelectedItemState>().updateState(_arguments.subChapterId! + 1);
                                              Navigator.pushReplacementNamed(
                                                context,
                                                '/content_volume_two',
                                                arguments: ContentVolumeTwoArguments(
                                                  _arguments.subChapterId! + 1,
                                                  _arguments.subChapterIndex! + 1,
                                                  _arguments.chapterId,
                                                ),
                                              );
                                            },
                                          )
                                              : const SizedBox()
                                        ],
                                      ),
                                      SliverToBoxAdapter(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Card(
                                              margin: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                bottom: 8,
                                              ),
                                              elevation: 2,
                                              shape:
                                              const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(20),
                                                  bottomRight:
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(20),
                                                    bottomRight:
                                                    Radius.circular(20),
                                                  ),
                                                  color: Color(0xFF1F8D6E),
                                                ),
                                                padding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 12,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${subChapterSnapshot.data![_arguments.subChapterIndex].dialog}',
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                          Color(0xFF243743),
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      '${subChapterSnapshot.data![_arguments.subChapterIndex].dialogTitle}',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontFamily: 'Play',
                                                      ),
                                                      textAlign:
                                                        TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                          (BuildContext context, int index) {
                                            return SecondVolumeChapterContentItem(
                                              item: snapshot.data![index],
                                              index: index,
                                              player: _assetsAudioPlayer,
                                              realtimePlayingInfo:
                                                  realtimePlayingInfo,
                                            );
                                          },
                                          childCount: snapshot.data!.length,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Platform.isAndroid
                                      ? const CircularProgressIndicator()
                                      : const CupertinoActivityIndicator(),
                                );
                        },
                      );
                    },
                  ),
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
