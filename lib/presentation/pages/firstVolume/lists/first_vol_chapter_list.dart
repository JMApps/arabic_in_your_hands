import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_chapters_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_chapters_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_chapter_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FirstVolChapterList extends StatefulWidget {
  const FirstVolChapterList({super.key});

  @override
  State<FirstVolChapterList> createState() => _FirstVolChapterListState();
}

class _FirstVolChapterListState extends State<FirstVolChapterList> {
  late final FirstVolChaptersDataRepository _firstVolChaptersDataRepository;
  late final FirstVolChaptersUseCase _firstVolChaptersUseCase;

  @override
  void initState() {
    _firstVolChaptersDataRepository = FirstVolChaptersDataRepository();
    _firstVolChaptersUseCase = FirstVolChaptersUseCase(_firstVolChaptersDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<FirstVolChapterEntity>>(
      future: _firstVolChaptersUseCase.fetchFirstChapters(
        tableName: locale.tableNameFirstVolChapters,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolChapterEntity>> snapshot) {
        if (snapshot.hasData) {
          return AnimationLimiter(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final FirstVolChapterEntity model = snapshot.data![index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 250),
                  child: SlideAnimation(
                    verticalOffset: 150,
                    child: FadeInAnimation(
                      child: FirstVolChapterItem(
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

