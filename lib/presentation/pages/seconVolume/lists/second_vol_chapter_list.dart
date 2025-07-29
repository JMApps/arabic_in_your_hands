import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_chapters_use_case.dart';
import 'package:arabicinyourhands/main.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_vol_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../l10n/app_localizations.dart';

class SecondVolChapterList extends StatefulWidget {
  const SecondVolChapterList({super.key});

  @override
  State<SecondVolChapterList> createState() => _SecondVolChapterListState();
}

class _SecondVolChapterListState extends State<SecondVolChapterList> {
  late final SecondVolChaptersUseCase _secondVolChaptersUseCase;

  @override
  void initState() {
    super.initState();
    _secondVolChaptersUseCase = SecondVolChaptersUseCase(SecondVolChaptersDataRepository());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SecondVolChapterEntity>>(
      future: _secondVolChaptersUseCase.fetchSecondChapters(
        tableName: locale.tableNameSecondVolChapters,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<SecondVolChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return AnimationLimiter(
            child: PageStorage(
              bucket: globalBucketSecondVolumeChapters,
              child: ListView.builder(
                key: const PageStorageKey<String>(AppConstraints.keyBucketSecondVolumeChapters),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final SecondVolChapterEntity model = snapshot.data![index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 250),
                    child: SlideAnimation(
                      verticalOffset: 150,
                      child: FadeInAnimation(
                        child: SecondVolChapterItem(
                          model: model,
                          index: index,
                        ),
                      ),
                    ),
                  );
                },
              ),
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

