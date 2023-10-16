import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/arguments/first_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/lists/first_vol_content_list.dart';
import 'package:arabicinyourhands/presentation/uiState/player/content_player_state.dart';
import 'package:arabicinyourhands/presentation/widgets/content_player_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstVolContentsPage extends StatefulWidget {
  const FirstVolContentsPage({
    super.key,
    required this.firstSubChapterEntity,
  });

  final FirstVolSubChapterEntity firstSubChapterEntity;

  @override
  State<FirstVolContentsPage> createState() => _FirstVolContentsPageState();
}

class _FirstVolContentsPageState extends State<FirstVolContentsPage> {
  late final FirstVolContentsUseCase _contentsUseCase;

  @override
  void initState() {
    super.initState();
    _contentsUseCase = FirstVolContentsUseCase(FirstVolContentsDataRepository());
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
                title: Text(widget.firstSubChapterEntity.dialogTitle),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/first_vol_contents_flip_page',
                        arguments: FirstSubChapterArgs(
                          model: widget.firstSubChapterEntity,
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
                      widget.firstSubChapterEntity.dialogSubTitle,
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
            child: FirstVolContentsList(
              firstSubChapterId: widget.firstSubChapterEntity.id,
            ),
          ),
        ),
        bottomNavigationBar: FutureBuilder<List<FirstVolContentEntity>>(
          future: _contentsUseCase.fetchFirstContentsById(
            tableName: locale!.tableNameFirstVolContents,
            firstSubChapterId: widget.firstSubChapterEntity.id,
          ),
          builder: (BuildContext context, AsyncSnapshot<List<FirstVolContentEntity>> snapshot) {
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
