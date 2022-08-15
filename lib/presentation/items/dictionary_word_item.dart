import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/change_word_popup.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DictionaryWordItem extends StatelessWidget {
  const DictionaryWordItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DictionaryWordModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      color: item.id.isOdd
          ? myColor.mainChapterCardColor
          : myColor.mainChapterCardColor.withOpacity(0.8),
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      item.word,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.myAccentColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.wordTranslate,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor.fromHex(item.wordItemColor),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Card(
                color: myColor.mainChapterCardColor,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Wrap(
                  runSpacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: double.maxFinite,
                      child: Text(
                        item.word,
                        style: TextStyle(
                          fontSize: 18,
                          color: myColor.myAccentColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      title: const Text('Изменить'),
                      trailing: Icon(
                        CupertinoIcons.pencil_circle,
                        color: myColor.myAccentColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: AnimatedPadding(
                                padding: MediaQuery.of(context).viewInsets,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.decelerate,
                                child: ChangeWordPopup(
                                  item: item,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      trailing: Icon(
                        CupertinoIcons.doc_on_clipboard,
                        color: myColor.myAccentColor,
                      ),
                      title: const Text(
                        'Скопировать',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        FlutterClipboard.copy('${item.word}\n${item.wordTranslate}');
                        context.read<DictionaryContentState>().showSnackBarMessage(context, 'Скопировано');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      title: const Text('Удалить'),
                      trailing: Icon(
                        CupertinoIcons.delete,
                        color: myColor.myAccentColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Удаление'),
                              content: const Text(
                                  'Вы уверены, что хотите удалить это слово?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(
                                    'Нет',
                                    style: TextStyle(
                                      color: myColor.myAccentColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text(
                                    'Да',
                                    style: TextStyle(
                                      color: myColor.myAccentColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<DictionaryContentState>()
                                        .showSnackBarMessage(
                                            context, 'Слово удалено');
                                    context
                                        .read<DictionaryContentState>()
                                        .deleteWord(item.id);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
