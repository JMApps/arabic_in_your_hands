import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/presentation/lists/fist_volume_sub_chapter_content_list.dart';
import 'package:arabicinyourhands/presentation/widgets/bottom_navigation_sub_chapter_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FistVolumeSubChapterContentPage extends StatelessWidget {
  FistVolumeSubChapterContentPage({
    Key? key,
    required this.firstVolumeChapterId,
    required this.firstVolumeSubChapterId,
    required this.firstVolumeSubChapterIndex,
  }) : super(key: key);

  final int firstVolumeChapterId;
  final int firstVolumeSubChapterId;
  final int firstVolumeSubChapterIndex;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentPlayerState(),
        ),
      ],
      child: FutureBuilder<List>(
        future: _databaseQuery.getAllFirstSubChapters(firstVolumeChapterId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var item = snapshot.data![firstVolumeSubChapterIndex]
                as VolumeFirstItemSubChapterModel;
            return Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      centerTitle: true,
                      backgroundColor: const Color(0xFF243743),
                      elevation: 0,
                      floating: true,
                      snap: false,
                      forceElevated: innerBoxIsScrolled,
                      expandedHeight: 50,
                      title: Text(item.dialog),
                      actions: [
                        IconButton(
                          icon: const Icon(CupertinoIcons.settings),
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/content_settings');
                          },
                        ),
                        firstVolumeSubChapterIndex + 1 < snapshot.data!.length
                            ? IconButton(
                                icon: const Icon(
                                  CupertinoIcons.forward,
                                  size: 30,
                                ),
                                splashRadius: 20,
                                onPressed: () {
                                  context
                                      .read<MainNavigationSelectedState>()
                                      .updateFirstSelectedState(item.id + 1);
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/first_volume_content',
                                    arguments: ContentVolumeOneArguments(
                                        firstVolumeChapterId,
                                        firstVolumeSubChapterId + 1,
                                        firstVolumeSubChapterIndex + 1),
                                  );
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Card(
                        color: const Color(0xFF006D50),
                        margin: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item.dialogTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child: FirstVolumeSubChapterContentList(
                    firstVolumeSubChapterId: firstVolumeSubChapterId,
                  ),
                ),
              ),
              bottomNavigationBar: const BottomNavigationSubChapterContent(),
            );
          }
          return const Material(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
