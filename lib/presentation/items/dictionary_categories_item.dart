import 'package:arabicinyourhands/data/database/model/dictionary_category_arguments.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/change_category_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DictionaryCategoriesItem extends StatelessWidget {
  const DictionaryCategoriesItem({Key? key, required this.item})
      : super(key: key);

  final DictionaryCategoryModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getReadDictionaryContentState = context.read<DictionaryContentState>();
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
                    fontFamily: 'GilroyMedium',
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
                  color: Color(
                    int.parse(item.wordCategoryColor),
                  ),
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
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Divider(
                      indent: 24,
                      endIndent: 24,
                      color: myColor.myPrimaryColor,
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
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
                                child: ChangeCategoryPopup(
                                  item: item,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                      color: myColor.myPrimaryColor,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
                              content: const Text('Вы уверены, что хотите удалить данную категорию вместе с её содержимым?'),
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
                                    context.read<DictionaryContentState>().showSnackBarMessage(
                                    context, 'Категория удалена');
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
                    Divider(
                      indent: 24,
                      endIndent: 24,
                      color: myColor.myPrimaryColor,
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
