import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_sub_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_sub_chapters_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_volume_sub_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SecondVolumeSubChapterList extends StatefulWidget {
  const SecondVolumeSubChapterList({super.key, required this.secondChapterId});

  final int secondChapterId;

  @override
  State<SecondVolumeSubChapterList> createState() =>
      _SecondVolumeSubChapterListState();
}

class _SecondVolumeSubChapterListState
    extends State<SecondVolumeSubChapterList> {
  late final SecondVolSubChaptersDataRepository
      _secondVolSubChaptersDataRepository;
  late final SecondVolSubChaptersUseCase _secondVolSubChaptersUseCase;
  late final PageController _pageController;

  @override
  void initState() {
    _secondVolSubChaptersDataRepository = SecondVolSubChaptersDataRepository();
    _secondVolSubChaptersUseCase =
        SecondVolSubChaptersUseCase(_secondVolSubChaptersDataRepository);
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SecondVolSubChapterEntity>>(
      future: _secondVolSubChaptersUseCase.fetchSecondSubChaptersById(
        tableName: locale.tableNameSecondVolSubChapters,
        chapterId: widget.secondChapterId,
      ),
      builder: (BuildContext context,
          AsyncSnapshot<List<SecondVolSubChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeInCubic,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final SecondVolSubChapterEntity model =
                              snapshot.data![index];
                          return SecondVolumeSubChapterItem(
                            model: model,
                            index: index,
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeInCubic,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SmoothPageIndicator(
                onDotClicked: (index) => _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.slowMiddle,
                ),
                controller: _pageController,
                count: snapshot.data!.length,
                effect: ScrollingDotsEffect(
                  maxVisibleDots: 7,
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: Colors.grey,
                  activeDotColor: appColors.secondary,
                ),
              ),
              const SizedBox(height: 8),
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
