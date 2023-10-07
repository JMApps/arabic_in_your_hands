import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/arabicDictionary/words_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/words_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/word_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordsList extends StatefulWidget {
  const WordsList({super.key});

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  late final WordsUseCase _wordsUseCase;

  @override
  void initState() {
    super.initState();
    _wordsUseCase = WordsUseCase(WordsDataReposioty.getInstance());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordEntity>>(
      future: _wordsUseCase.fetchAllWords(),
      builder: (BuildContext context, AsyncSnapshot<List<WordEntity>> snapshot) {
        if (snapshot.hasData) {
          snapshot.data!.shuffle();
          return CupertinoScrollbar(
            child: ListView.builder(
              padding: AppStyles.mainMardingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final WordEntity model = snapshot.data![index];
                return WordItem(model: model);
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
