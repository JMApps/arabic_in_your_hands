import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/change_word_popup.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DictionaryWordItem extends StatelessWidget {
  const DictionaryWordItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DictionaryWordModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final appLocalizations = AppLocalizations.of(context)!;
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    bottom: 16,
                    left: 16,
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
                            fontWeight: FontWeight.bold,
                            color: myColor.myAccentColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        indent: 24,
                        endIndent: 24,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Text(
                          appLocalizations.change,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
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
                      const Divider(
                        indent: 24,
                        endIndent: 24,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        trailing: Icon(
                          CupertinoIcons.doc_on_clipboard,
                          color: myColor.myAccentColor,
                        ),
                        title: Text(
                          appLocalizations.copy,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          FlutterClipboard.copy(
                              '${item.word}\n${item.wordTranslate}');
                          context.read<DictionaryContentState>().showSnackBarMessage(context, appLocalizations.copied);
                          Navigator.of(context).pop();
                        },
                      ),
                      const Divider(
                        indent: 24,
                        endIndent: 24,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Text(
                          appLocalizations.delete,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
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
                                title: Text(appLocalizations.deleting),
                                content: Text(appLocalizations.dictionary_word_delete_message),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text(
                                      appLocalizations.no,
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
                                      appLocalizations.yes,
                                      style: TextStyle(
                                        color: myColor.myAccentColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      context.read<DictionaryContentState>().showSnackBarMessage(
                                              context, appLocalizations.dictionary_word_category_deleted);
                                      context.read<DictionaryContentState>().deleteWord(item.id);
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
