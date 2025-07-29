import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_sub_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_sub_chapters_use_case.dart';
import 'package:arabicinyourhands/main.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_vol_sub_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class SecondVolSubChapterList extends StatefulWidget {
  const SecondVolSubChapterList({
    super.key,
    required this.secondChapterId,
  });

  final int secondChapterId;

  @override
  State<SecondVolSubChapterList> createState() => _SecondVolSubChapterListState();
}

class _SecondVolSubChapterListState extends State<SecondVolSubChapterList> {
  late final SecondVolSubChaptersUseCase _secondVolSubChaptersUseCase;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _secondVolSubChaptersUseCase = SecondVolSubChaptersUseCase(SecondVolSubChaptersDataRepository());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SecondVolSubChapterEntity>>(
      future: _secondVolSubChaptersUseCase.fetchSecondSubChaptersById(
        tableName: locale.tableNameSecondVolSubChapters,
        chapterId: widget.secondChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<SecondVolSubChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return Column(
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
                      child: PageStorage(
                        bucket: globalBucketSecondVolumeSubChapters,
                        child: PageView.builder(
                          key: PageStorageKey<int>(widget.secondChapterId),
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final SecondVolSubChapterEntity model =
                                snapshot.data![index];
                            return SecondVolSubChapterItem(
                              model: model,
                            );
                          },
                        ),
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
