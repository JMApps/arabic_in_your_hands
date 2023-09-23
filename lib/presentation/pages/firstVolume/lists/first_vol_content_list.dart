import 'package:arabicinyourhands/data/repositories/firstVolume/first_vol_contents_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/usecases/firstVolume/first_vol_contents_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_content_item_left.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/items/first_vol_content_item_right.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/material.dart';

class FirstVolContentList extends StatefulWidget {
  const FirstVolContentList({super.key, required this.firstSubChapterId});

  final int firstSubChapterId;

  @override
  State<FirstVolContentList> createState() => _FirstVolContentListState();
}

class _FirstVolContentListState extends State<FirstVolContentList> {
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
    return FutureBuilder<List<FirstVolContentEntity>>(
      future: _firstVolContentsUseCase.fetchFirstContentsById(
        tableName: 'Table_of_first_contents_ru',
        firstSubChapterId: widget.firstSubChapterId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<FirstVolContentEntity>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
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
