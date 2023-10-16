import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_sub_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_sub_chapters_use_case.dart';
import 'package:arabicinyourhands/main.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/fist_vol_sub_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstVolSubChapterList extends StatefulWidget {
  const FirstVolSubChapterList({super.key, required this.firstChapterId});

  final int firstChapterId;

  @override
  State<FirstVolSubChapterList> createState() => _FirstVolSubChapterListState();
}

class _FirstVolSubChapterListState extends State<FirstVolSubChapterList> {
  late final FirstVolSubChaptersUseCase _firstVolSubChaptersUseCase;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _firstVolSubChaptersUseCase = FirstVolSubChaptersUseCase(FirstVolSubChaptersDataRepository());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<FirstVolSubChapterEntity>>(
      future: _firstVolSubChaptersUseCase.fetchFirstSubChaptersById(
        tableName: locale.tableNameFirstVolSubChapters,
        chapterId: widget.firstChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolSubChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return PageStorage(
            bucket: globalBucketFirstVolumeSubChapters,
            child: Column(
              key: PageStorageKey<int>(widget.firstChapterId),
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeInCubic,
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final FirstVolSubChapterEntity model =
                                snapshot.data![index];
                            return FirstVolumeSubChapterItem(model: model);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeInCubic,
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
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
