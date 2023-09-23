import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_category_arguments.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/change_category_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DictionaryCategoryItem extends StatelessWidget {
  const DictionaryCategoryItem({Key? key, required this.item})
      : super(key: key);

  final DictionaryCategoryModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getReadDictionaryContentState = context.read<DictionaryContentState>();
    final appLocalizations = AppLocalizations.of(context)!;
    return Card(
      color: Theme.of(context).colorScheme.mainChapterCardColor,
      margin: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _priorityColor(context, item.priority),
                width: 3,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.wordCategoryTitle,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor.fromHex(item.wordCategoryColor),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/category_words_content',
            arguments: DictionaryCategoryArguments(
              item.id,
              item.wordCategoryTitle,
              item.wordCategoryColor,
              item.priority,
            ),
          );
        },
        onLongPress: () {
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
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        width: double.maxFinite,
                        child: Text(
                          item.wordCategoryTitle,
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
                                  child: ChangeCategoryPopup(
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
                                content: Text(appLocalizations.dictionary_category_delete_message),
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
                                              context, appLocalizations.dictionary_category_category_deleted);
                                      getReadDictionaryContentState.deleteWordCategory(item.id);
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

  Color _priorityColor(BuildContext context, int priority) {
    final myColor = Theme.of(context).colorScheme;
    Color priorityColor = Colors.white;
    switch (priority) {
      case 0:
        priorityColor = myColor.priorityWithoutColor;
        break;
      case 1:
        priorityColor = myColor.priorityLowColor;
        break;
      case 2:
        priorityColor = myColor.priorityHighColor;
        break;
      case 3:
        priorityColor = myColor.priorityMediumColor;
        break;
    }
    return priorityColor;
  }
}
