import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/lists/second_vol_content_list.dart';
import 'package:arabicinyourhands/presentation/widgets/bottom_navigation_sub_chapter_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolContentsPage extends StatelessWidget {
  const SecondVolContentsPage({
    super.key,
    required this.secondVolSubChapterModel,
  });

  final SecondVolSubChapterEntity secondVolSubChapterModel;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentPlayerState(),
        ),
      ],
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                floating: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: 60,
                title: Text(
                  secondVolSubChapterModel.dialogTitle,
                ),
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: AppStyles.mainMardingMini,
                  shape: AppStyles.mainShape,
                  child: Padding(
                    padding: AppStyles.mainMardingMini,
                    child: Text(
                      secondVolSubChapterModel.dialogSubTitle,
                      style: const TextStyle(
                        fontSize: 18,
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
            child: CupertinoScrollbar(
              child: SecondVolContentList(
                secondSubChapterId: secondVolSubChapterModel.id,
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationSubChapterContent(),
      ),
    );
  }
}
