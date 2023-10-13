import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/second_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/lists/second_vol_content_list.dart';
import 'package:arabicinyourhands/presentation/uiState/content_player_state.dart';
import 'package:arabicinyourhands/presentation/widgets/content_player_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolContentsPage extends StatelessWidget {
  const SecondVolContentsPage({
    super.key,
    required this.secondVolSubChapterEntity,
  });

  final SecondVolSubChapterEntity secondVolSubChapterEntity;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
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
                backgroundColor: appColors.primaryColor,
                elevation: 0,
                centerTitle: true,
                floating: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: 60,
                title: Text(secondVolSubChapterEntity.dialogTitle),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/second_vol_contents_flip_page',
                        arguments: SecondSubChapterArgs(
                          model: secondVolSubChapterEntity,
                        ),
                      );
                    },
                    icon: const Icon(CupertinoIcons.creditcard),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: AppStyles.mainMardingMini,
                  color: appColors.secondary,
                  child: Padding(
                    padding: AppStyles.mainMarding,
                    child: Text(
                      secondVolSubChapterEntity.dialogSubTitle,
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
                secondSubChapterId: secondVolSubChapterEntity.id,
              ),
            ),
          ),
        ),
        bottomNavigationBar: const ContentPlayerContaier(),
      ),
    );
  }
}
