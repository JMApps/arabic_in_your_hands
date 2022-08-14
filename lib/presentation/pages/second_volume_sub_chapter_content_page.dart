import 'package:arabicinyourhands/data/database/model/content_volume_two_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_second_item_flip_content_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/lists/second_volume_sub_chapter_content_list.dart';
import 'package:arabicinyourhands/presentation/widgets/bottom_navigation_sub_chapter_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeSubChapterContentPage extends StatelessWidget {
  SecondVolumeSubChapterContentPage({
    Key? key,
    required this.secondVolumeChapterId,
    required this.secondVolumeSubChapterId,
    required this.secondVolumeSubChapterIndex,
  }) : super(key: key);

  final int secondVolumeChapterId;
  final int secondVolumeSubChapterId;
  final int secondVolumeSubChapterIndex;
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
        future: _databaseQuery.getAllSecondSubChapters(secondVolumeChapterId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var item = snapshot.data![secondVolumeSubChapterIndex]
                as VolumeSecondItemSubChapterModel;
            return Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      snap: false,
                      forceElevated: innerBoxIsScrolled,
                      expandedHeight: 50,
                      title: Text(item.dialog),
                      actions: [
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.creditcard,
                            color: Colors.white,
                          ),
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/second_volume_content_flip',
                              arguments: VolumeSecondItemFlipContentArguments(
                                secondVolumeSubChapterId,
                                item.dialogTitle,
                              ),
                            );
                          },
                        ),
                        secondVolumeSubChapterIndex + 1 < snapshot.data!.length
                            ? IconButton(
                                icon: const Icon(
                                  CupertinoIcons.forward,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                splashRadius: 20,
                                onPressed: () {
                                  context
                                      .read<MainNavigationSelectedState>()
                                      .updateSecondSelectedState(item.id + 1);
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/second_volume_content',
                                    arguments: ContentVolumeTwoArguments(
                                        secondVolumeChapterId,
                                        secondVolumeSubChapterId + 1,
                                        secondVolumeSubChapterIndex + 1),
                                  );
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Card(
                        color: Theme.of(context).colorScheme.myAccentColor,
                        margin: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item.dialogTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Gilroy medium',
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
                  child: SecondVolumeSubChapterContentList(
                    secondVolumeSubChapterId: secondVolumeSubChapterId,
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
