import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/repositories/arabicDictionary/words_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/word_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/articles_use_case.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/word_option.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArabicDictionaryPage extends StatefulWidget {
  const ArabicDictionaryPage({super.key});

  @override
  State<ArabicDictionaryPage> createState() => _ArabicDictionaryPageState();
}

class _ArabicDictionaryPageState extends State<ArabicDictionaryPage> {
  late final WordsUseCase _wordsUseCase;

  @override
  void initState() {
    super.initState();
    _wordsUseCase = WordsUseCase(WordsDataReposioty.getInstance());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale!.arabicDictionary),
      ),
      body: FutureBuilder<List<WordEntity>>(
        future: _wordsUseCase.fetchAllWords(),
        builder:
            (BuildContext context, AsyncSnapshot<List<WordEntity>> snapshot) {
          if (snapshot.hasData) {
            snapshot.data!.shuffle();
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final WordEntity model = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => WordOption(wordModel: model),
                        );
                      },
                      shape: AppStyles.mainShape,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      title: Wrap(
                        children: [
                          Text(
                            model.word,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Scheherazade',
                              color: appColors.error,
                            ),
                            textAlign: TextAlign.end,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(width: 8),
                          Visibility(
                            visible: model.plural != null,
                            child: Text(
                              'мн. ${model.plural}',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Visibility(
                        visible: model.shortMeaning != null,
                        child: Text(
                          model.shortMeaning ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      trailing: Visibility(
                        visible: model.species != null,
                        child: CircleAvatar(
                          backgroundColor:
                              appColors.secondary.withOpacity(0.25),
                          child: Text(
                            model.species ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: appColors.secondary,
      //   onPressed: () {},
      //   child: const Icon(CupertinoIcons.add),
      // ),
    );
  }
}
