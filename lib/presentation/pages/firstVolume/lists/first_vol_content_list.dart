import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_content_item_left.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_content_item_right.dart';
import 'package:arabicinyourhands/presentation/uiState/player/content_player_state.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FirstVolContentsList extends StatefulWidget {
  const FirstVolContentsList({super.key, required this.firstSubChapterId});

  final int firstSubChapterId;

  @override
  State<FirstVolContentsList> createState() => _FirstVolContentsListState();
}

class _FirstVolContentsListState extends State<FirstVolContentsList> {
  late final FirstVolContentsUseCase _firstVolContentsUseCase;
  final ItemScrollController _contentController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    _firstVolContentsUseCase = FirstVolContentsUseCase(FirstVolContentsDataRepository());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final int trackIndex = Provider.of<ContentPlayerState>(context).getCurrentTrackIndex;
    return FutureBuilder<List<FirstVolContentEntity>>(
      future: _firstVolContentsUseCase.fetchFirstContentsById(
        tableName: locale!.tableNameFirstVolContents,
        firstSubChapterId: widget.firstSubChapterId,
      ),
      builder: (BuildContext context,
          AsyncSnapshot<List<FirstVolContentEntity>> snapshot) {
        if (snapshot.hasData) {
          if (_contentController.isAttached) {
            _contentController.scrollTo(
              index: trackIndex,
              alignment: 0.5,
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 5),
            );
          }
          return ScrollablePositionedList.builder(
            physics: const ClampingScrollPhysics(),
            itemScrollController: _contentController,
            padding: AppStyles.mainMardingHorizontalMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, index) {
              final FirstVolContentEntity model = snapshot.data![index];
              return index.isOdd
                  ? FirstVoContentItemLeft(
                      model: model,
                      index: index,
                    )
                  : FirstVolContentItemRight(
                      model: model,
                      index: index,
                    );
            },
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(error: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
