import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/arguments/second_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/lists/second_vol_content_list.dart';
import 'package:arabicinyourhands/presentation/uiState/player/content_player_state.dart';
import 'package:arabicinyourhands/presentation/widgets/content_player_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class SecondVolContentsPage extends StatefulWidget {
  const SecondVolContentsPage({
    super.key,
    required this.secondSubChapterEntity,
  });

  final SecondVolSubChapterEntity secondSubChapterEntity;

  @override
  State<SecondVolContentsPage> createState() => _SecondVolContentsPageState();
}

class _SecondVolContentsPageState extends State<SecondVolContentsPage> {
  late final SecondVolContentsUseCase _contentsUseCase;

  @override
  void initState() {
    super.initState();
    _contentsUseCase = SecondVolContentsUseCase(SecondVolContentsDataRepository());
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? locale = AppLocalizations.of(context);
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
                title: Text(widget.secondSubChapterEntity.dialogTitle),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/second_vol_contents_flip_page',
                        arguments: SecondSubChapterArgs(
                          model: widget.secondSubChapterEntity,
                        ),
                      );
                      Provider.of<ContentPlayerState>(context, listen: false).stopDispose();
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
                      widget.secondSubChapterEntity.dialogSubTitle,
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
            child: SecondVolContentList(
              secondSubChapterId: widget.secondSubChapterEntity.id,
            ),
          ),
        ),
        bottomNavigationBar: FutureBuilder<List<SecondVolContentEntity>>(
          future: _contentsUseCase.fetchSecondContentsById(
            tableName: locale!.tableNameSecondVolContents,
            secondSubChapterId: widget.secondSubChapterEntity.id,
          ),
          builder: (BuildContext context, AsyncSnapshot<List<SecondVolContentEntity>> snapshot) {
            if (snapshot.hasData) {
              Provider.of<ContentPlayerState>(context, listen: false).initPlayer(snapshot: snapshot);
              return ContentPlayerContaier(snapshot: snapshot);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
