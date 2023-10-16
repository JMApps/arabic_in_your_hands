import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/flip_back_second_vol_item.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/flip_front_second_vol_item.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/main_smooth_page_indicator.dart';
import 'package:arabicinyourhands/presentation/widgets/second_vol_share_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SecondVolContentFlipList extends StatefulWidget {
  const SecondVolContentFlipList({
    super.key,
    required this.secondSubChapterId,
  });

  final int secondSubChapterId;

  @override
  State<SecondVolContentFlipList> createState() => _SecondVolContentFlipListState();
}

class _SecondVolContentFlipListState extends State<SecondVolContentFlipList> {
  late final SecondVolContentsUseCase _secondVolContentsUseCase;
  late final PageController _pageController = PageController();
  final FlipCardController _flipCardController = FlipCardController();

  @override
  void initState() {
    super.initState();
    _secondVolContentsUseCase = SecondVolContentsUseCase(SecondVolContentsDataRepository());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SecondVolContentEntity>>(
      future: _secondVolContentsUseCase.fetchSecondContentsById(
        tableName: locale.tableNameSecondVolContents,
        secondSubChapterId: widget.secondSubChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<SecondVolContentEntity>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    final SecondVolContentEntity model = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        _flipCardController.flipcard();
                      },
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => SecondVolShareCopy(model: model),
                        );
                      },
                      child: Consumer<ContentFlipState>(
                        builder: (BuildContext context, flipState, _) {
                          return FlipCard(
                            animationDuration: const Duration(milliseconds: 300),
                            rotateSide: RotateSide.bottom,
                            controller: _flipCardController,
                            axis: FlipAxis.vertical,
                            frontWidget: flipState.getCardSideMode
                                ? FlipFrontSecondVolItem(
                              model: model,
                              index: index,
                            )
                                : FlipBackSecondVolItem(
                              model: model,
                              index: index,
                            ),
                            backWidget: flipState.getCardSideMode
                                ? FlipBackSecondVolItem(
                              model: model,
                              index: index,
                            )
                                : FlipFrontSecondVolItem(
                              model: model,
                              index: index,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              MainSmoothPageIndicator(
                controller: _pageController,
                length: snapshot.data!.length,
              ),
              const SizedBox(height: 16),
            ],
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
