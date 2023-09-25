import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_content_item_left.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_content_item_right.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstVolContentsList extends StatefulWidget {
  const FirstVolContentsList({super.key, required this.firstSubChapterId});

  final int firstSubChapterId;

  @override
  State<FirstVolContentsList> createState() => _FirstVolContentsListState();
}

class _FirstVolContentsListState extends State<FirstVolContentsList> {
  late final FirstVolContentsDataRepository _firstVolContentsDataRepository;
  late final FirstVolContentsUseCase _firstVolContentsUseCase;

  @override
  void initState() {
    _firstVolContentsDataRepository = FirstVolContentsDataRepository();
    _firstVolContentsUseCase = FirstVolContentsUseCase(_firstVolContentsDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<FirstVolContentEntity>>(
      future: _firstVolContentsUseCase.fetchFirstContentsById(
        tableName: locale.tableNameFirstVolContents,
        firstSubChapterId: widget.firstSubChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolContentEntity>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: AppStyles.mainMardingHorizontalMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, index) {
              final FirstVolContentEntity model = snapshot.data![index];
              return index.isOdd
                  ? FirstVolContentItemLeft(
                model: model,
                index: index,
              )
                  : FirstVolContentItemRight(
                model: model,
                index: index,
              );
            },
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

