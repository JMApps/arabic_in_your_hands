import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:arabicinyourhands/core/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/lists/first_vol_content_list.dart';
import 'package:arabicinyourhands/presentation/widgets/content_player_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolContentsPage extends StatelessWidget {
  const FirstVolContentsPage({
    super.key,
    required this.firstVolSubChapterModel,
  });

  final FirstVolSubChapterEntity firstVolSubChapterModel;

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
                title: Text(firstVolSubChapterModel.dialogTitle),
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  shape: AppStyles.mainShape,
                  color: appColors.secondary,
                  child: Padding(
                    padding: AppStyles.mainMardingMini,
                    child: Text(
                      firstVolSubChapterModel.dialogSubTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.whiteColor,
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
              child: FirstVolContentList(
                firstSubChapterId: firstVolSubChapterModel.id,
              ),
            ),
          ),
        ),
        bottomNavigationBar: const ContantPlayerContainer(),
      ),
    );
  }
}
