import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/flip_back_first_vol_item.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/flip_front_first_vol_item.dart';
import 'package:arabicinyourhands/presentation/uiState/content_flip_state.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/first_vol_share_copy.dart';
import 'package:arabicinyourhands/presentation/widgets/main_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class FirstVolContentFlipList extends StatefulWidget {
  const FirstVolContentFlipList({
    super.key,
    required this.firstSubChapterId,
  });

  final int firstSubChapterId;

  @override
  State<FirstVolContentFlipList> createState() => _FirstVolContentFlipListState();
}

class _FirstVolContentFlipListState extends State<FirstVolContentFlipList> {
  late final FirstVolContentsUseCase _firstVolContentsUseCase;
  late final PageController _pageController = PageController();
  final FlipCardController _flipCardController = FlipCardController();

  @override
  void initState() {
    super.initState();
    _firstVolContentsUseCase = FirstVolContentsUseCase(FirstVolContentsDataRepository());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<FirstVolContentEntity>>(
      future: _firstVolContentsUseCase.fetchFirstContentsById(
        tableName: locale!.tableNameFirstVolContents,
        firstSubChapterId: widget.firstSubChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolContentEntity>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    final FirstVolContentEntity model = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        _flipCardController.flipcard();
                      },
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => FirstVolShareCopy(model: model),
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
                                ? FlipFrontFirstVolItem(
                                    model: model,
                                    index: index,
                                  )
                                : FlipBackFirstVolItem(
                                    model: model,
                                    index: index,
                                  ),
                            backWidget: flipState.getCardSideMode
                                ? FlipBackFirstVolItem(
                                    model: model,
                                    index: index,
                                  )
                                : FlipFrontFirstVolItem(
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
