import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/secondVolume/second_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/usecases/seconVolume/second_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_vol_content_item_left.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/items/second_vol_content_item_right.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondVolContentList extends StatefulWidget {
  const SecondVolContentList({super.key, required this.secondSubChapterId});

  final int secondSubChapterId;

  @override
  State<SecondVolContentList> createState() => _SecondVolContentListState();
}

class _SecondVolContentListState extends State<SecondVolContentList> {
  final SecondVolContentsUseCase _secondVolContentsUseCase = SecondVolContentsUseCase(SecondVolContentsDataRepository());

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<SecondVolContentEntity>>(
      future: _secondVolContentsUseCase.fetchSecondContentsById(
        tableName: locale!.tableNameSecondVolContents,
        secondSubChapterId: widget.secondSubChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<SecondVolContentEntity>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            padding: AppStyles.mainMardingHorizontalMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, index) {
              final SecondVolContentEntity model = snapshot.data![index];
              return index.isOdd
                  ? SecondVolContentItemLeft(
                      model: model,
                      index: index,
                    )
                  : SecondVolContentItemRight(
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
