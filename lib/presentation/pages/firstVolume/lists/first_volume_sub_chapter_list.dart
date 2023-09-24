import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_sub_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_sub_chapters_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/fist_volume_sub_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstVolumeSubChapterList extends StatefulWidget {
  const FirstVolumeSubChapterList({super.key, required this.firstChapterId});

  final int firstChapterId;

  @override
  State<FirstVolumeSubChapterList> createState() => _FirstVolumeSubChapterListState();
}

class _FirstVolumeSubChapterListState extends State<FirstVolumeSubChapterList> {
  late final FirstVolSubChaptersDataRepository _firstVolSubChaptersDataRepository;
  late final FirstVolSubChaptersUseCase _firstVolSubChaptersUseCase;

  @override
  void initState() {
    _firstVolSubChaptersDataRepository = FirstVolSubChaptersDataRepository();
    _firstVolSubChaptersUseCase = FirstVolSubChaptersUseCase(_firstVolSubChaptersDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<FirstVolSubChapterEntity>>(
      future: _firstVolSubChaptersUseCase.fetchFirstChaptersById(
        tableName: locale.tableNameFirstVolSubChapters,
        chapterId: widget.firstChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolSubChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final FirstVolSubChapterEntity model = snapshot.data![index];
              return FirstVolumeSubChapterItem(
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
