import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FistVolumeSubChapterContentPage extends StatelessWidget {
  FistVolumeSubChapterContentPage({
    Key? key,
    required this.firstVolumeChapterId,
    required this.firstVolumeSubChapterIndex,
  }) : super(key: key);

  final int firstVolumeChapterId;
  final int firstVolumeSubChapterIndex;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllFirstSubChapters(firstVolumeChapterId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var item = snapshot.data![firstVolumeSubChapterIndex] as VolumeFirstItemSubChapterModel;
          return Scaffold(
            backgroundColor: Colors.teal[100],
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                          Navigator.of(context).pushNamed('content_settings');
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
                                context.read<MainNavigationSelectedState>().updateFirstSelectedState(item.id + 1);
                                Navigator.pushReplacementNamed(
                                  context, '/first_volume_content',
                                  arguments: ContentVolumeOneArguments(firstVolumeChapterId, firstVolumeSubChapterIndex + 1),
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
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          item.dialogTitle,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: Container(
                ),
              ),
            ),
          );
        }
        return const Material(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
