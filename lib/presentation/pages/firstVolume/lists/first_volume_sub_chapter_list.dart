import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_sub_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_sub_chapters_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/fist_volume_sub_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstVolumeSubChapterList extends StatefulWidget {
  const FirstVolumeSubChapterList({super.key, required this.firstChapterId});

  final int firstChapterId;

  @override
  State<FirstVolumeSubChapterList> createState() => _FirstVolumeSubChapterListState();
}

class _FirstVolumeSubChapterListState extends State<FirstVolumeSubChapterList> {
  late final FirstVolSubChaptersDataRepository _firstVolSubChaptersDataRepository;
  late final FirstVolSubChaptersUseCase _firstVolSubChaptersUseCase;
  late final PageController _pageController;

  @override
  void initState() {
    _firstVolSubChaptersDataRepository = FirstVolSubChaptersDataRepository();
    _firstVolSubChaptersUseCase = FirstVolSubChaptersUseCase(_firstVolSubChaptersDataRepository);
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<FirstVolSubChapterEntity>>(
      future: _firstVolSubChaptersUseCase.fetchFirstChaptersById(
        tableName: locale.tableNameFirstVolSubChapters,
        chapterId: widget.firstChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolSubChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
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
                          final FirstVolSubChapterEntity model = snapshot.data![index];
                          return FirstVolumeSubChapterItem(
                            model: model,
                            index: index,
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
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
              const SizedBox(height: 16),
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
