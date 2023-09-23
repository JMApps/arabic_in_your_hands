import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_chapters_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_volume_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SecondVolumeChapterList extends StatefulWidget {
  const SecondVolumeChapterList({super.key});

  @override
  State<SecondVolumeChapterList> createState() => _SecondVolumeChapterListState();
}

class _SecondVolumeChapterListState extends State<SecondVolumeChapterList> {
  late final SecondVolChaptersDataRepository _secondVolChaptersDataRepository;
  late final SecondVolChaptersUseCase _secondVolChaptersUseCase;

  @override
  void initState() {
    _secondVolChaptersDataRepository = SecondVolChaptersDataRepository();
    _secondVolChaptersUseCase = SecondVolChaptersUseCase(_secondVolChaptersDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SecondVolChapterEntity>>(
      future: _secondVolChaptersUseCase.fetchSecondChapters(
        tableName: 'Table_of_second_chapters_ru',
      ),
      builder: (BuildContext context, AsyncSnapshot<List<SecondVolChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return AnimationLimiter(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final SecondVolChapterEntity model = snapshot.data![index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 250),
                  child: SlideAnimation(
                    verticalOffset: 150,
                    child: FadeInAnimation(
                      child: SecondVolumeChapterItem(
                        model: model,
                        index: index,
                      ),
                    ),
                  ),
                );
              },
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
