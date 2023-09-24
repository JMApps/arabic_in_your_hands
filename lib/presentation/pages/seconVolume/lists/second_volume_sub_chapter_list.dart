import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_sub_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_sub_chapters_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_volume_sub_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondVolumeSubChapterList extends StatefulWidget {
  const SecondVolumeSubChapterList({super.key, required this.secondChapterId});

  final int secondChapterId;

  @override
  State<SecondVolumeSubChapterList> createState() => _SecondVolumeSubChapterListState();
}

class _SecondVolumeSubChapterListState extends State<SecondVolumeSubChapterList> {
  late final SecondVolSubChaptersDataRepository _secondVolSubChaptersDataRepository;
  late final SecondVolSubChaptersUseCase _secondVolSubChaptersUseCase;

  @override
  void initState() {
    _secondVolSubChaptersDataRepository = SecondVolSubChaptersDataRepository();
    _secondVolSubChaptersUseCase = SecondVolSubChaptersUseCase(_secondVolSubChaptersDataRepository);
    super.initState();
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
          return GridView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final SecondVolSubChapterEntity model = snapshot.data![index];
              return SecondVolumeSubChapterItem(
                model: model,
                index: index,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.5,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
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
