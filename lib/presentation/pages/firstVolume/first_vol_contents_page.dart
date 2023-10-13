import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/arguments/first_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/lists/first_vol_content_list.dart';
import 'package:arabicinyourhands/presentation/uiState/content_player_state.dart';
import 'package:arabicinyourhands/presentation/widgets/content_player_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolContentsPage extends StatelessWidget {
  const FirstVolContentsPage({
    super.key,
    required this.firstVolSubChapterEntity,
  });

  final FirstVolSubChapterEntity firstVolSubChapterEntity;

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
                title: Text(firstVolSubChapterEntity.dialogTitle),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/first_vol_contents_flip_page',
                        arguments: FirstSubChapterArgs(
                          model: firstVolSubChapterEntity,
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
                      firstVolSubChapterEntity.dialogSubTitle,
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
              child: FirstVolContentsList(
                firstSubChapterId: firstVolSubChapterEntity.id,
              ),
            ),
          ),
        ),
        bottomNavigationBar: const ContentPlayerContaier(),
      ),
    );
  }
}
